class Ability
  include CanCan::Ability

  def initialize(user)
    # if user
      can :read, Entry.where({user_id: user})
      can :read, Technique.where({user_id: user})
      can :read, Roadmap.where({user_id: user})
      can :update, Entry.where({user_id: user})
      can :update, Technique.where({user_id: user})
      can :update, Roadmap.where({user_id: user})
    # end
  end
end
