class Company < ApplicationRecord
  has_many :users, through: :user_companies
  has_many :customers, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :city, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :siret, presence: true
end
