<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Carbon\Carbon;

use Auth;
use Session;
use App\Models\Student;
use App\Models\Teacher;
use App\Mail\OtpMail;
use Mail;

class AdminController extends Controller
{
    public function loginView(){
        Auth::guard('teacher')->logout();
        Auth::guard('student')->logout();
        session()->invalidate();
        session()->regenerateToken();
        return view('admin.login');
    }

    public function userLogin(Request $request){
        $request->validate([
            'txtUsername' => 'required|email',
            'txtPassword' => 'required|min:6',
            'cbxRole'     => 'required',
        ]);

        $remember = (int)$request->filled('cbxRemember'); 
        $role     = $request->input('cbxRole');        

        $credentials = [
            'email'    => $request->txtUsername,
            'password' => $request->txtPassword,
            'status'   => 1,
        ];

        switch($role){
            case 1: // teacher
                if (Auth::guard('teacher')->attempt($credentials, $remember)) {
                    $request->session()->regenerate();
                    return redirect('/')->with('success', 'Login successful!');
                } else {
                    return redirect()->back()->withErrors(['txtUsername' => 'Invalid teacher credentials.']);
                }
                break;
            case 2: // student
                if (Auth::guard('student')->attempt($credentials, $remember)) {
                    $request->session()->regenerate();
                    return redirect('/student-dashboard')->with('success', 'Login successful!');
                } else {
                    return redirect()->back()->withErrors(['txtUsername' => 'Invalid student credentials.']);
                }
                break;
            default:
                return redirect()->back()->withErrors(['cbxRole' => 'Invalid role selected.']);
                break;
        }
    }

    public function changePassView(){
        return view('admin.change-password');
    }

    public function updateUpdate(Request $request){

        $validator = Validator::make($request->all(), [
            'current_password' => 'required',
            'new_password' => [
                'required',
                'string',
                'min:6',              // Minimum 6 characters
                'regex:/[A-Z]/',      // At least one uppercase letter
                'regex:/[a-z]/',      // At least one lowercase letter
                'regex:/[0-9]/',      // At least one number
                'regex:/[!@#$%^&*(),.?":{}|<>]/' // At least one special character
            ],
            'confirm_password' => 'required|same:new_password',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $user = Auth::guard('teacher')->user();        

        // Check current password
        if (!Hash::check($request->current_password, $user->password)) {
            return redirect()->back()->with('error', 'Current password is incorrect');
        }

        // Update password
        $user->password = Hash::make($request->new_password);
        $user->save();

        return redirect()->back()->with('success', 'Password updated successfully');
    }

    public function profile(){
        return view('profile.my-account');
    }

    public function setting(){
        return view('profile.setting');
    }

    public function support(){
        return view('profile.support');
    }

    public function forgetPass(){
        return view('admin.auth.forget-password');
    }

    public function findAccount(Request $request){
        $request->validate([
            'txtEmail' => 'required|email',
        ]);

        $data = Teacher::where('email', $request->txtEmail)->first();

        if (!$data) {
            $data = Student::where('email', $request->txtEmail)->first();
        }

        if(!$data){
            return redirect()->back()->with('error','User account not found. Please try again.');
        }

        $otp = rand(100000, 999999);
        $data->otp = $otp;
        $data->otp_expires_at = Carbon::now()->addMinutes(10);
        $data->save();

        Mail::to($data->email)->send(new OtpMail($otp));

        session(['reset_email' => $data->email]);

        return redirect()->route('otp.form')->with('success', 'OTP sent to your email!');
    }

    public function otpConfirm(){
        return view('admin.auth.otp');
    }

    public function otpVarify(Request $request){
        $request->validate([
            'txtOTP' => 'required|digits:6',
        ]);

        $email = session('reset_email');

        $data = Teacher::where('email', $email)->first();

        if (!$data) {
            $data = Student::where('email', $email)->first();
        }

        if(!$data){
            return redirect()->back()->with('error', 'Invalid request!');
        }

        if ($data->otp != $request->txtOTP) {
            return redirect()->back()->with('error', 'Invalid OTP!');
        }

        if (now()->gt($data->otp_expires_at)) {
            return redirect()->back()->with('error', '⏰ OTP Expired!');
        }

        return redirect()->route('new.password.form');
    }

    public function createNewPass(){
        return view('admin.auth.new-password-form');
    }

    public function createPassword(Request $request){
        $request->validate([
            'password' => 'required|min:6|confirmed',
        ]);

        $email = session('reset_email');

        $data = Teacher::where('email', $email)->first();

        if (!$data) {
            $data = Student::where('email', $email)->first();
        }

        if(!$data){
            return redirect()->back()->with('error', 'Invalid request!');
        }

        $data->password = Hash::make($request->password);
        $data->otp = null;
        $data->otp_expires_at = null;
        $data->save();

        session()->forget('reset_email');

        return redirect()->route('login-view')->with('success', 'Password reset successful!');
    }
}
