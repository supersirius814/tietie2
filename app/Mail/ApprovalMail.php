<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class ApprovalMail extends Mailable
{
    use Queueable, SerializesModels;
	
	public $data;
	public $attachedFiles;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($data, $attachedFiles)
    {
        $this->data = $data;
		$this->attachedFiles = $attachedFiles;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $mail = $this->from($this->data['BM_email'], 'KMS')
                ->replyTo($this->data['updater']->email, $this->data['updater']->name)
                ->subject($this->data['subject'])
                ->view('mail.approval');
		
		foreach ($this->attachedFiles as $attachedFile) {
			$mail->attachData($attachedFile['data'], $attachedFile['file_name']);
		}
		
		return $mail;
    }
}
