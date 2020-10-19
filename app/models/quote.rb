class Quote < ApplicationRecord
  belongs_to :customer
  has_many :services, through: :quote_services
end
