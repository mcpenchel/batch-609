class Patient < ActiveRecord::Base
  has_many :consultations
  has_many :doctors, through: :consultations

  belongs_to :intern

  validates :intern_id, uniqueness: true, allow_nil: true
  # Without the allow_nil: true, we couldn't have two patients
  # without interns :'(
end