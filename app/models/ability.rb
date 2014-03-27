class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role?(:admin)
      can :manage, :all
    elsif user.role?(:registered)
      can :manage, :all
    else
      can :read, :all
      can :create, User
    end
  end
end
