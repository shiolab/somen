require 'test_helper'

class MessageTest < ActionMailer::TestCase
  test "targeted_mail" do

    to = "tanacobachie@gmail.com"
    mail = Message.targeted_mail(Mailform.find(1), to, Message.create_key(to))

    assert_equal "Notice", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.sender
    assert_match "Hi", mail.body.encoded
  end

end
