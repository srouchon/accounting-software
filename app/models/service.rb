class Service < ApplicationRecord
  has_many :quotes, through: :quote_services
end
