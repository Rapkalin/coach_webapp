class CoachesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:edit, :search, :verify_authenticity_token]

  def edit
    @coach = current_coach
  end

  def search
    if (User.all.include?(User.find((params[:id]))))
      @user = User.find(params[:id])
      redirect_to new_training_path(user_id: @user.id)
    else
      flash['alert'] = "L'utilisateur n'existe pas. Veuillez réessayer avec un autre ID"
      redirect_to root_path
    end
  end
end
