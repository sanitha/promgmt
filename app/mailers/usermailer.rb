class Usermailer < ActionMailer::Base
  #default :from => "from@example.com"
  def welcome_email(user)
    @user = user
    @url  = "http://rubysoftprojectmanagementsystem.com/login"
    mail(:from => "sanitha.charanghattu@revenuemed.com",:to => user.email, :subject => "Welcome to Project Management Group!")
   # mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end

  def send_projectid
    
  end
end
# mail(:from => "sanitha.charanghattu@revenuemed.com",:to => "little.rigo@revenuemed.com", :subject => "Welcome to My Awesome Site")

