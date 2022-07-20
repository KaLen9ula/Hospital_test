class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :avatar, -> { order created_at: :desc }
  has_many :patient, dependent: :destroy
  has_many :doctor, dependent: :destroy
  enum role: [:patient, :doctor, :admin]

  validates :phone_num,uniqueness: true
  validates_format_of :phone_num, :with =>  /\d[0-9]\)*\z/ , :message => "Only positive number without spaces are allowed"
  validates_length_of :phone_num, :minimum => 6,:maximum => 24

  def get_recommendation(doctor_id, patient_id)
    if Recommendation.exists?(doctor_id: doctor_id, patient_id: patient_id)
      Recommendation.find_by(doctor_id: doctor_id, patient_id: patient_id).recommendation
    end
  end

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
