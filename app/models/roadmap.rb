class Roadmap < ActiveRecord::Base
  belongs_to :user
  has_many :techniques
end
