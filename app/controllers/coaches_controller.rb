class CoachesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:edit, :search, :verify_authenticity_token]

  def edit
    @coach = current_coach
  end

  def search
    @user = User.find(params[:id])
    if(@user)
      redirect_to new_training_path(user_id: @user.id)
    else
      render 'root'
    end
  end
end
