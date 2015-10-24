class Message < ActionMailer::Base

  def targeted_mail(from, to, subject, body)
    return if from.blank? || to.blank? || subject.blank? || body.blank?
    @body = body
    mail to: to, from: from, subject: subject
  end

  def self.create_key(word)
    require 'digest/sha1'
    Digest::SHA1.hexdigest(word)
  end

end
