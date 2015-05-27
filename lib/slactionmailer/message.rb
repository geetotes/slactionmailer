require 'erb'


module SlactionMailer
  class Message < ERB
    
    def initialize(mail, options = {})
      @mail = mail
      @template = options.fetch(:template, self.class.template)
      super(@template)
    end

    def body
      @mail.text_part.body.decoded
    end 

    def from
      @from ||= Array(@mail['from']).join(", ")
    end

    def to
      @to ||= Array(@mail['to']).join(", ")
    end

    def self.template
"Subject: <%= @mail.subject %>
 From: <%= from %>
 To: <%= to %>
 
 <%= body %>"
    end

    def result
      super(binding)
    end

    def self.to_template(mail)
      @mail = mail
      mail.to_s
     #"#{ @mail.subject }\nFrom: #{ @mail.from } To: #{ @mail.to }\n #{ @mail.body }"
    end
  end
end
