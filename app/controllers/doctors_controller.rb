class DoctorsController < ApplicationController
  before_action :set_doctor, only: %i[profile]

  def profile
    authorize! :read, @doctor
    @appointments = []
    @users = User.joins(:patient).where(users: { patients: @doctor.patients })
    @users.each do |user|
      unless user.patient[0].recommendations.exists?(doctor_id: @doctor.id)
        @appointments << user
      end
    end
  end

  def set_doctor
    @user = current_user
    @doctor = Doctor.joins(:user).where(doctors: { user_id: @user.id })[0]
  end
end

