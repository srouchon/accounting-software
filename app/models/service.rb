class Service < ApplicationRecord
  has_many :quote_services
  has_many :quotes, through: :quote_services
end