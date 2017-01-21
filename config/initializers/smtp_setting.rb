ActionMailer::Base.delivery_method = :smtp  
ActionMailer::Base.smtp_settings = {            
  :address              => "smtp.zoho.com", 
  :port                 => "587",                 
  :user_name            => 'crownshotty@gmail.com',
  :password             => 'templogin',     
  :authentication       => :login,
  :ssl                  => true,
  :tls                  => true,
  :enable_starttls_auto => true    
}

     
