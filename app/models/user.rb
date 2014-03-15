class User < ActiveRecord::Base
  attr_accessible :membership, :name, :user_image
end
