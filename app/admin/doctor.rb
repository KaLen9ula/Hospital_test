ActiveAdmin.register Doctor do
  permit_params :category_id

  index do
    selectable_column
    id_column
    column "First Name" do |doctor|
      doctor.user.first_name
    end
    column "Last Name" do |doctor|
      doctor.user.last_name
    end
    column "Email" do |doctor|
      doctor.user.email
    end

    column :category
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  controller do
    def scoped_collection
      super.includes(:user)
    end
  end

  filter :phone_num
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :category
    end
    f.actions
  end

  show do
    panel "Doctor Details" do
      attributes_table_for doctor do
        row "First Name" do |doctor|
          doctor.user.first_name
        end
        row "Last Name" do |doctor|
          doctor.user.last_name
        end
        row "Patients" do |doctor|
          doctor.patients
        end
        row "Category" do |doctor|
          doctor.category
        end
      end
    end
  end
end
