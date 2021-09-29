<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class MaintenanceRequestMail extends Mailable
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
		$mail = $this->subject($this->data['subject'])
			->view('mail.maintenance_request');
        
        if ( preg_match( '/冷凍庫|エアコン/', $this->data['equipment'] ) ) {
            $mail->priority(1);
        }
		
		foreach ($this->attachedFiles as $attachedFile) {
			$mail->attachData($attachedFile['data'], $attachedFile['file_name']);
		}
		
        return $mail;
    }
}
