class ToDo < ApplicationRecord
  belongs_to :category
  belongs_to :trip

end