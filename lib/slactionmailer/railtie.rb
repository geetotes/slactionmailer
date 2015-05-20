module SlactionMailer
  class Railtie < Rails::Railtie
    initializer "letter_opener.add_delivery_method" do
      ActiveSupport.on_load :action_mailer do
        ActionMailer::Base.add_delivery_method :slack, SlactionMailer::DeliveryMethod, :webhook => ENV["SLACK_WEBHOOK_URL"]
      end
    end
  end
end
