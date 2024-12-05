class Category < ApplicationRecord
  belongs_to :user
  has_many :expenses
  validates :name, presence: true, uniqueness: true
  # validates :description, presence: true
end
