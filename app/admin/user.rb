ActiveAdmin.register User do
  permit_params :role, :email, :first_name, :phone_num, :last_name, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :phone_num
    column :email
    column :role
    column :doctor
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :phone_num
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :role
      f.input :email
      f.input :phone_num
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    after_create do
      user = User.find_by_phone_num(params[:user][:phone_num])
      if params[:user][:role] == "patient"
        patient = Patient.create!(user_id: user.id)
        user.patient_id = patient.id
        user.save
      elsif params[:user][:role] == "doctor"
        doctor = Doctor.create!(user_id:user.id)
        user.doctor_id = doctor.id
        user.save
      end
    end
  end
end

