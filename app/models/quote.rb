class Quote < ApplicationRecord
  belongs_to :customer
  has_many :quote_services, dependent: :destroy
  has_many :services, through: :quote_services
end
