class Trip < ApplicationRecord
  belongs_to :user

  has_many :flight, dependent: :destroy
  has_many :to_do, dependent: :destroy
  has_many :expense, dependent: :destroy
end