class User < ActiveRecord::Base
  has_many :images
  has_many :patterns
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :membership, :name, :user_image

  mount_uploader :user_image, UserImageUploader
end
