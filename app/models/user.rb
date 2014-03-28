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
  attr_accessible :membership, :name, :user_image, :role, :description

  mount_uploader :user_image, UserImageUploader
  before_validation :set_role_to_registered

  def role?(role_to_compare)
    @role.to_s == role_to_compare.to_s
  end 

  private
  def set_role_to_registered
    @role ||= "registered"
  end

end
