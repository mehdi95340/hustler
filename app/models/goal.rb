class Goal < ApplicationRecord
  belongs_to :user

  def target_progress
    user.total_saved.fdiv(target_amount) * 100
  end
end
