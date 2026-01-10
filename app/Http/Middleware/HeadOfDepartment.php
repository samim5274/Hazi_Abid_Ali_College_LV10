<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Auth;

class HeadOfDepartment
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $allowed = [
            'Head of Department',
            'Dean',
            'Vice Principal',
            'Principal',
        ];

        if (!in_array(Auth::guard('teacher')->user()->designation, $allowed))
        {
            return redirect()->back()->with('warning', 'You do not have permission access this page. Thank You..!');
        }
        return $next($request);
    }
}
