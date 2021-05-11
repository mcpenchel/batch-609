class Intern < ActiveRecord::Base
  belongs_to :doctor

  # The decision is from your customer/client
  # It's a business rule.
  # has_many :patients
  has_one :patient
end