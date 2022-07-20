class Patient < ApplicationRecord
  belongs_to :user

  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments, dependent: :destroy
  has_many :recommendations, dependent: :destroy
end
