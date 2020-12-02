class Bill < ApplicationRecord
  belongs_to :customer
  belongs_to :company
  has_many :bill_services, dependent: :destroy
  has_many :services, through: :bill_services
end
