class FriendReminderMailer < ApplicationMailer
  default from: "Tester@sandboxca39590945bb46d08e2973c146ccd71a.mailgun.org"

  def test_email
    @name = 'Jane Doe'
    @login = 'JaneDoe123'
    @url = 'www.google.com'
    mail(to: 'insert_email@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
