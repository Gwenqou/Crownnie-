class Contact < MailForm::Base
  attribute :name,  :validate => true
  attribute :email
  attribute :message, :validate => true
  attribute :nickname,  :captcha  => true

  

  def headers
    {
      :subject => "My Contact Form",
      :to => "crownshotty@gmail.com",
      :from => "info@crownshot.com"
    }
  end
end