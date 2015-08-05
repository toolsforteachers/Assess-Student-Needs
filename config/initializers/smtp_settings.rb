# :nocov:
if Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp

  ActionMailer::Base.smtp_settings = {
    :enable_starttls_auto => true,
    :address        => 'smtp.gmail.com',
    :port           => 587,
    :domain         => 'toolsforteachers.org.uk',
    :authentication => :plain,
    :user_name      => ENV['SMTP_USER'],
    :password       => ENV['SMTP_PASS']
  }
end
# :nocov:
