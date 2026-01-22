<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class StudentDueMail extends Mailable
{
    use Queueable, SerializesModels;

    public $company;
    public $student;

    public function __construct($company, $student)
    {
        $this->company = $company;
        $this->student = $student;
    }

    public function build()
    {
        return $this->subject('Due Payment Reminder - ' . ($this->company->name ?? 'School'))
            ->view('email.student-due');
    }
}
