require 'slack-notifier'

String.class_eval do
  def to_channel
    notifier = Slack::Notifier.new "https://hooks.slack.com/services/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", channel: "#rubberduck", username: "SlactionMailer"
    notifier.ping "Test"
    true
  end
end
