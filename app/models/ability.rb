class Ability
  include CanCan::Ability

  
def initialize(user)
    user ||= User.new
    if user.role?(:admin)
      can :manage, :all
    elsif user.role?(:registered)
        can :read, :all
        can [:new, :create, :update, :edit, :show] Pattern
        can [:new, :create, :update, :edit, :show], User, :id => user.id
    else
        can :read, :all
        can :create, User
    end
  end
end
