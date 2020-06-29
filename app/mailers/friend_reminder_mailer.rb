class FriendReminderMailer < ApplicationMailer
  def test_email
    @name = 'bob joe'
    @login = 'bob123'
    @url = 'www.google.com'
    mail(to: 'blah@user.com', subject: 'Welcome to My Awesome Site')
  end
end
