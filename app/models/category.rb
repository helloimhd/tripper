class Category < ApplicationRecord
  has_many :to_do
  has_many :expense
end