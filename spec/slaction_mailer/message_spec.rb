require 'spec_helper'

describe SlactionMailer::Message do
  
  it 'formats a message exactally how `puts Mail` would' do
    mail = Mail.new do
      from    'mikel@test.lindsaar.net'
      to      'you@test.lindsaar.net'
      subject 'This is a test email'
      body    'This is the email body'
    end 
    message = SlactionMailer::Message.new(mail)
    puts message.result

    pending
  end

  it 'attaches attachments properly' do
    pending
  end
end
