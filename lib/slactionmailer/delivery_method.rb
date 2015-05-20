module SlactionMailer
  class DeliveryMethod
    class InvalidOption < StandardError; end

    attr_accessor :settings
    
    def initialize(options = {})
      raise InvalidOption, "A Slack webhook is required to send messages" if options[:webhook].nil?
      self.settings = options
    end

    def deliver!(mail)
      notifier = Slack::Notifier.new settings[:webhook], channel:  settings[:channel], username: settings[:username]
      message = Message.new(mail)
      notifier.ping message.result
    end
  end
end

