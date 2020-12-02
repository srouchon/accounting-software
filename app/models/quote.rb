class Quote < ApplicationRecord
  belongs_to :customer
  has_many :quote_services, dependent: :destroy
  has_many :services, through: :quote_services
  # accepts_nested_attributes_for :quote_services, allow_destroy: true
  # accepts_nested_attributes_for :services, allow_destroy: true
end
