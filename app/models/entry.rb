class Entry < ActiveRecord::Base
  has_many :techniques
  belongs_to :user
end
