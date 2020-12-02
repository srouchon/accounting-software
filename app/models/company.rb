class Company < ApplicationRecord
  belongs_to :user
  has_many :customers, dependent: :destroy
  has_many :quotes, through: :customers, dependent: :destroy
  has_many :bills, through: :customers, dependent: :destroy
  has_many :services

  validates :name, presence: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :city, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :siret, presence: true
  validates :siret, presence: true
  validates :tva, presence: true
end
