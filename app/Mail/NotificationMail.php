<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class NotificationMail extends Mailable
{
    use Queueable, SerializesModels;
	
	public $data;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($data)
    {
        $this->data = $data;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        if ( '承認待ちリスト' == $this->data['type'] ) {
            
            $mail = $this->subject($this->data['subject'])
                    ->view('mail.notification')
                    ->priority(1);
            
            return $mail;
        }

        $mail = $this->subject($this->data['subject'])
                ->view('mail.notification');
        				
        return $mail;
    }
}
