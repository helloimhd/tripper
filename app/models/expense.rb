class Expense < ApplicationRecord
  belongs_to :trip
  belongs_to :category

  # def paid
  #   #expenses.where(spent: true).sum(:amount)
  #   expenses.sum(:amount)
  # end
end