class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :entries
  has_many :techniques # NHO: Feel like this relationship wouldnt be direct, but rather throguh entries or roadmaps.
  has_many :roadmaps
end
