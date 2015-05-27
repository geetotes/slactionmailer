module SlactionMailer
  class DeliveryMethod
    class InvalidOption < StandardError; end

    attr_accessor :settings
    
    def initialize(options = {})
      raise InvalidOption, 'ENV["SLACK_WEBHOOK_URL"]is required to send messages' if options[:webhook].nil?
      raise InvalidOption, 'ENV["SLACK_CHANNEL"]is required to send messages' if options[:channel].nil?
      raise InvalidOption, 'ENV["SLACK_USERNAME"]is required to send messages' if options[:username].nil?
      self.settings = options
    end

    def deliver!(mail)
      notifier = Slack::Notifier.new settings[:webhook], channel:  settings[:channel], username: settings[:username]
      if settings.key?(:template)
        message = Message.new(mail, :template => settings[:template])
      else
        message = Message.new(mail)
      end
      notifier.ping message.result
    end
  end
end

