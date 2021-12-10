class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    if current_coach
      # @trainings = training.select('user_id').from('trainings').group(:user_id).where(coach_id: current_coach.id)
      # @trainings = training.select('user_id').from('trainings').where(coach_id: current_coach.id)
      @user = User.find(params[:id])
      @trainings = @user.trainings.where(coach_id: current_coach.id)
    end
  end
end
