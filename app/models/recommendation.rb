class Recommendation < ApplicationRecord
  belongs_to :patient

  has_many :doctors, dependent: :destroy
  has_many :patients, dependent: :destroy
end
