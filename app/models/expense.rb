class Expense < ApplicationRecord
  belongs_to :trip
  belongs_to :category
end