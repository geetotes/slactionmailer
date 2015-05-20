# Slactionmailer

Slactionmailer is a mailer for ActionMailer that sends your message to a Slack channel.

## Installation

Simple include the gem in your gemfile.
```ruby
gem 'slactionmailer'
```
Or install from the command line.
```ruby
gem install slacktionmailer
```

## Setup

In your `enviroment.rb`, add the following lines:
```
config.slaction_mailer.webhook
config.slaction_mailer.channel
config.slaction_mailer.username
config.slaction_mailer.avatar
```

## Usage

Slactionmailer can be used as the default mailer
```ruby
config.default_mailer => :slack
```
Or only be used for certain messages 

```ruby
def notification
  mail(:from => 'from@example.com',           
       :to => 'to@example.com', 
       :subject => 'Subject',
       :delivery_method => :slack)
end
```
Either way, your mailer messages will appear like this:
[image]

##About

Slactionmailer uses `slack-notify` to communicate with Slack and takes inspiration from the `letter-opener` gem.


This project rocks and uses MIT-LICENSE.
