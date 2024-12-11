class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :budgets, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :goals, dependent: :destroy

  def total_saved
    sum = 0
    budgets.each do |budget|
      sum += budget.saved_amount
    end
    return sum
  end
end
