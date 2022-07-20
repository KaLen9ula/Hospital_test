class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.patient?
      can :read, Patient
      can :index, Patient
      can :update, Patient
    end

    if user.doctor?
      can :read, Doctor
      can :index, Doctor
      can :update, Doctor
    end
  end
end

