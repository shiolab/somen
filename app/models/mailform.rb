class Mailform < ActiveRecord::Base
  belongs_to :organization
  has_many :mailform_histories, ->{order("created_at DESC") }
end
