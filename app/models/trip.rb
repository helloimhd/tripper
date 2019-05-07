class Trip < ApplicationRecord
  belongs_to :user

  has_many :flight
  has_many :to_do
  has_many :expense
end