class UserMailer < ActionMailer::Base
  default from: "admin@collabme.com"
  
  def welcome_email(researcher)
    @researcher = researcher
    @url  = "localhost:3000/"
    mail(:to => researcher.email, :subject => "Welcome to CollabMe")
  end
end
