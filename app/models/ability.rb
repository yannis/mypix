class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, :home
    if user.persisted?
      can [:read, :create, :update, :destroy], Pic, user_id: user.id
      can [:read, :update, :destroy], User, id: user.id
    end
  end
end
