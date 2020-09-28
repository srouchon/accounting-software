class Bill < ApplicationRecord
  belongs_to :quote
  belongs_to :customer
end
