ActiveAdmin.register Patient do
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

    column :recommendations
    column :created_at
    actions
  end

  show do
    panel "Patient Details" do
      attributes_table_for patient do
        row "First Name" do |patient|
          patient.user.first_name
        end
        row "Last Name" do |patient|
          patient.user.last_name
        end
        row "Doctors" do |patient|
          patient.doctors
        end
        row "Recommendations" do |patient|
          patient.recommendations
        end
      end
    end
  end
end
