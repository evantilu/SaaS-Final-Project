class UserMailer < ApplicationMailer
  default from: 'LetsMeet@gmail.com'

  def notify_user(event, user)
  	@event = event
    @user = user
    mail(to: "#{@user.email}", subject: "Group Event Reminder")
  end
end
