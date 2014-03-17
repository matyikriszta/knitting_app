class User < ActiveRecord::Base
  acts_as_voter

  has_many :images
  has_many :patterns
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :membership, :name, :user_image, :role

  mount_uploader :user_image, UserImageUploader
end
