class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # Define User abilities
    if user.is? :admin
      can :manage, :all
    end
    if user.is? :requester
      #can :create, KindleRequest
    end
  end
end

