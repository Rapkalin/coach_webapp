class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    if current_coach
      # @sessions = Session.select('user_id').from('sessions').group(:user_id).where(coach_id: current_coach.id)
      # @sessions = Session.select('user_id').from('sessions').where(coach_id: current_coach.id)
      @user = User.find(params[:id])
      @sessions = @user.sessions.where(coach_id: current_coach.id)

    end
  end
end
