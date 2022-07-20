class Category < ApplicationRecord
  belongs_to :doctor, optional: true

  has_many :doctors, dependent: :destroy

  validates :name, uniqueness: true
end
