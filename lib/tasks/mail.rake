namespace :mail do
  task send_reminder: :environment do
    FriendReminderMailer.test_email.deliver_now
  end
end