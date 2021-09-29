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
        $from = [
            'address' => config('mail.from.address'),
            'name'    => 'KMS Notify'
        ];
        
        if ( '承認待ちリスト' == $this->data['type'] ) {
            
            $mail = $this->from($from['address'], $from['name'])
                    ->subject($this->data['subject'])
                    ->view('mail.notification')
                    ->priority(1);
            
            return $mail;
        }

        $mail = $this->from($from['address'], $from['name'])
                ->subject($this->data['subject'])
                ->view('mail.notification');
        				
        return $mail;
    }
}
