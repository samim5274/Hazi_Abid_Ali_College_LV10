<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use Illuminate\Support\Facades\Log;

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
        if (empty($notifiable->email) || !filter_var($notifiable->email, FILTER_VALIDATE_EMAIL)) {
            Log::warning("Backup email skipped for user: {$notifiable->id}, invalid email: {$notifiable->email}");
            return (new MailMessage)
                    ->subject('Backup Notification Skipped')
                    ->line('Your email is invalid or missing. Backup email could not be sent.');
        }

        try {
            return (new MailMessage)
                ->subject('✅ Database Backup - HAAC')
                ->greeting('Hi ' . $notifiable->first_name . ',')
                ->line('Your database backup has been completed successfully.')
                ->line('🗂 Backup File: ' . basename($this->file))
                ->line('🕒 Backup Date: ' . now()->format('d M Y, H:i A'))
                ->attach($this->file, [
                    'as' => 'database-backup.zip',
                    'mime' => 'application/zip',
                ])
                ->line('Thank you for using our School Management System!');
        } catch (\Exception $e) {
            Log::error("Failed to send backup email to {$notifiable->email}: " . $e->getMessage());
            return (new MailMessage)
                    ->subject('Backup Notification Failed')
                    ->line('There was an error sending the backup email. Please check logs.');
        }
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
