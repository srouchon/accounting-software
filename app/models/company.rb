class Company < ApplicationRecord
  has_many :users, through: :user_companies
  has_many :customers
end
