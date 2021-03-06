require 'spec_helper'

describe SlactionMailer::Message do
  let(:mail) { 
    Mail.new do
      from    'mikel@test.lindsaar.net'
      to      'you@test.lindsaar.net'
      subject 'This is a test email'
      body    'This is the email body'
    end 
  }
  it 'can run without a template' do
    expect { message = SlactionMailer::Message.new(mail) }.not_to raise_error
  end

  it 'can use a template' do
    template = File.read('spec/examples/template.text.erb')
    expect { message = SlactionMailer::Message.new(mail, :template => template) }.not_to raise_error
  end

  it 'renders attachments properly' do
    pending
  end
end
