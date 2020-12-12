class Bill < ApplicationRecord
  belongs_to :customer
  has_many :bill_services, dependent: :destroy
  has_many :services, through: :bill_services
  
  validates :ref_bill, presence: true
  validates :date, presence: true
end
