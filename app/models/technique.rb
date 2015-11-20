class Technique < ActiveRecord::Base
  belongs_to :entry
  belongs_to :roadmap
  belongs_to :user

end
