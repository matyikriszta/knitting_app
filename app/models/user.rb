class User < ActiveRecord::Base
  acts_as_voter

  has_many :images
  has_many :patterns
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, omniauth_providers: [:google_oauth2]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :membership, :name, :user_image, :role, :description, :uid, :provider

  mount_uploader :user_image, UserImageUploader
  before_validation :set_role_to_registered


  def role?(role_to_compare)
    role.to_s == role_to_compare.to_s
  end 

  
def self.from_omniauth(auth)
  if user = User.find_by_email(auth.info.email)
    user.provider = auth.provider
    user.uid = auth.uid
    user
  else
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end

  private
  def set_role_to_registered
    self.role ||= "registered"
  end

end
