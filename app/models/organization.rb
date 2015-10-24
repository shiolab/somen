class Organization < ActiveRecord::Base
  has_many :mailforms, ->{where("is_hidden is null or is_hidden = 'f'").order("created_at DESC")}
end
