class CompanyMessage < ApplicationRecord
  belongs_to :room
  belongs_to :company
end
