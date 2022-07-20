class Users::RegistrationsController < Devise::RegistrationsController
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_sign_up_path_for(resource)
    @patient = Patient.create!(user_id: current_user.id)
    current_user.patient_id = @patient.id
    current_user.save
    '/patient/profile'
    super(resource)
  end

  def after_update_path_for(resource)
    request.referer
  end
end
