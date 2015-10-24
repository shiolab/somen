class MailformHistory < ActiveRecord::Base
  belongs_to :mailform
  has_many :sent_logs, ->{order("created_at") }
  has_many :access_logs, ->{order("created_at") }
end
