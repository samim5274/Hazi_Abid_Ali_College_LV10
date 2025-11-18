<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class BackupCompleted extends Notification
{
    use Queueable;

    protected $file;
    /**
     * Create a new notification instance.
     */
    public function __construct( $file)
    {
        $this->file = $file;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
    public function via(object $notifiable): array
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     */
    public function toMail(object $notifiable): MailMessage
    {
        return (new MailMessage)
                    ->subject('✅ Database Backup - SMS')
                    ->greeting('Hi ' . $notifiable->first_name . ',')
                    ->line('Your database backup has been completed successfully.')
                    ->line('🗂 Backup File: ' . $this->file)
                    ->line('🕒 Backup Date: ' . now()->format('d M Y, H:i A'))
                    ->line('Thank you for using our School Management System!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @return array<string, mixed>
     */
    public function toArray(object $notifiable): array
    {
        return [
            'message' => 'Database backup completed successfully.',
            'file' => $this->file
        ];
    }
}
