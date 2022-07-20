class HomeController < ApplicationController

  before_action :set_user, only: %i[index]

  def index
    if current_user&.patient?
      redirect_to '/patient/profile'
    elsif current_user&.doctor?
      redirect_to '/doctor/profile'
    else
      redirect_to '/users/sign_in'
    end
  end

  def create
  end

  def set_user
    @user = current_user
    if @user
      @patient = Patient.joins(:user).where(patients: { user_id: @user.id })[0]
      @doctor = Doctor.joins(:user).where(doctors: { user_id: @user.id })[0]
    end
  end
end
