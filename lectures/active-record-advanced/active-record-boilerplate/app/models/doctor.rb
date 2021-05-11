class Doctor < ActiveRecord::Base
  has_many :interns # creates an instance method

  has_many :consultations
  has_many :patients, through: :consultations # through the join table

  validates :last_name, presence: true
end