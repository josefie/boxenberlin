class Ability
  include CanCan::Ability

  def initialize(user) #user == club
    if user && user.admin? #admin
      can :manage, :all
      can :approve, Event
    else
      if user #logged in
        can :read, :all
        can [:create, :read, :update, :destroy], Club do |club|
          club.id == user.id
        end
        can :create, Event
        can [:update, :destroy], Event do |event|
          event.club_id == user.id and event.upcoming?
        end
        can :create, Boxer
        can [:update, :destroy], Boxer do |boxer|
          boxer.club_id == user.id
        end
        can :apply, Event do |event|
          event.get_deadline >= Date.today
        end
        can :create_fights, Event do |event|
          event.club_id == user.id
        end
      else #guest
        can :read, Event
        can [:read, :create], Club
      end
    end
    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
