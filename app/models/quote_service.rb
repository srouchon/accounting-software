class QuoteService < ApplicationRecord
  belongs_to :quote
  belongs_to :service
end
