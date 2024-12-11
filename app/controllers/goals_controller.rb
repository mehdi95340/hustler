class GoalsController < ApplicationController

  def index
    @goals = current_user.goals
  end

  def show
  end

  def new
    @goal = current_user.goals.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save!
      redirect_to goals_path, notice: ""
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:target_amount, :due_date, :title, :description)
  end
end
