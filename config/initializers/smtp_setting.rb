ActionMailer::Base.delivery_method = :smtp  
ActionMailer::Base.smtp_settings = {            
  :address              => "smtp.zoho.com", 
  :port                 => "587",                 
  :user_name            => ENV['zoho_username'],
  :password             => ENV['zoho_password'],        
  :authentication       => :login,
  #:ssl                  => true,
  #:tls                  => true,
  :enable_starttls_auto => true    
}

