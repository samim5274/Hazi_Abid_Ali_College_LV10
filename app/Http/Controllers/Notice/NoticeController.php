<?php

namespace App\Http\Controllers\Notice;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

use Auth;
use Session;
use App\Models\Teacher;
use App\Models\Notice;
use App\Models\Company;

class NoticeController extends Controller
{
    public $date;

    public function __construct()
    {
        $this->date = Carbon::now()->format('Y-m-d');
    }

    public function index(){
        $company = Company::first();
        $notice = Notice::with('user')->orderBy('id', 'desc')->get();
        return view('notice.notice', compact('notice','company'));
    }

    public function create(Request $request){
        $request->validate([
            'title'         => 'required|string|max:255',
            'description'   => 'nullable|string',
            'attachment'    => 'nullable|file|mimes:pdf,jpg,jpeg,png|max:2048', // max 2MB
            'txtNoticeType' => 'required'
        ]);

        $data               = new Notice();
        $data->title        = $request->title;
        $data->description  = $request->description;
        $data->publish_date = $this->date;
        $data->notice_type  = $request->txtNoticeType;
        $data->user_id      = Auth::guard('teacher')->user()->id;

        if ($request->hasFile('attachment')) {
            $file = $request->file('attachment');
            $filename = $this->date.'_'.time() . '_' . $file->getClientOriginalName();
            $destination = public_path('notices');
            if (!file_exists($destination)) {
                mkdir($destination, 0777, true);
            }
            $file->move($destination, $filename);          
            $data->attachment = $filename;
        }

        $data->save();
        return redirect()->back()->with('success','Notice published successfully.');
    }

    public function delete($id){
        $notice = Notice::where('id', $id)->first();
        if(!$notice){
            return redirect()->back()->with('warning','Notice not found. Please try again. Thank You!');
        }
        if ($notice->attachment) {
            $filePath = public_path('notices/' . $notice->attachment);

            if (file_exists($filePath)) {
                unlink($filePath);
            }
        }
        $notice->delete();
        return redirect()->back()->with('success','Notice deleted successfully.');
    }

    public function attachView($file){
        $path = public_path('notices/' . $file);

        if (!file_exists($path)) {
            abort(404, 'File not found');
        }

        // View the file in browser (PDF, image, doc etc.)
        return response()->file($path);
    }

    public function viewNotice($id){
        $company = Company::first();
        $notice = Notice::where('id', $id)->with('user')->first();
        if(!$notice){
            return redirect()->back()->with('warning','Notice not found. Please try again. Thank You!');
        }
        return view('notice.notice-view', compact('notice','company'));
    }
}
