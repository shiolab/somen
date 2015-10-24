# Preview all emails at http://localhost:3000/rails/mailers/message
class MessagePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/message/targeted_mail
  def targeted_mail
    to = "tanacobachie@gmail.com"
    Message.targeted_mail(Mailform.find(1), to, Message.create_key(to))
  end

end
