class Category < ApplicationRecord
  has_many :expenses
  validates :name, presence: true, uniqueness: true
  # validates :description, presence: true
end
