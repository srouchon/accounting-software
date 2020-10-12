class Customer < ApplicationRecord
  belongs_to :company
  validates :name, presence: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :city, presence: true
  validates :phone_1, presence: true
  validates :email_1, presence: true
end
