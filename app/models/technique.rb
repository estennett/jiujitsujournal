class Technique < ActiveRecord::Base
  belongs_to :entry
  belongs_to :roadmap
  belongs_to :user # NHO: Feel like this relationship would already be established because of the hierarchy of your associations 

end
