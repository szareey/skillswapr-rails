class UserMailer < ActionMailer::Base
  
  default from: "Sana@example.com"

  def account_deleted(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, 
          subject: 'An admin has deleted your account suckka!') do |f|
      f.html {}
    end
  end

end
