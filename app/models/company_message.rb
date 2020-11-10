class CompanyMessage < ApplicationRecord
  belongs_to :room
  belongs_to :company

  validates :message, presence: true
end
