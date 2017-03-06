module SlactionMailer
  class DeliveryMethod
    class InvalidOption < StandardError; end

    attr_accessor :settings

    def initialize(options = {})
      raise InvalidOption, 'ENV["SLACK_USERNAME"]is required to send messages' if options[:username].nil?
      self.settings = options
    end

    def deliver!(mail)
      raise InvalidOption, 'channel is required to send messages' if mail[:channel].nil? && ENV["SLACK_CHANNEL"].nil?
      raise InvalidOption, 'webhook is required to send messages' if mail[:webhook].nil? && ENV["SLACK_USERNAME"].nil?
      channel = mail[:channel].nil? ? ENV["SLACK_CHANNEL"] : mail[:channel].value
      webhook = mail[:webhook].nil? ? ENV["SLACK_WEBHOOK_URL"] : mail[:webhook].value
      notifier = Slack::Notifier.new webhook, channel: channel, username: settings[:username]
      if settings.key?(:template)
        message = Message.new(mail, :template => settings[:template])
      else
        message = Message.new(mail)
      end
      notifier.ping message.result
    end
  end
end

