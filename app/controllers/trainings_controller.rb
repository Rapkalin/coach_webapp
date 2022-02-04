class TrainingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :new]

  def new
    if current_coach
      @coach = current_coach
      @user = User.find(params[:user_id])
      @training = Training.new
    end
  end

  def create
    if current_coach
      @coach = current_coach
      @user = User.find(params["training"]["user_id"])
      @training = Training.new(training_params)
      @training.save!
      if @training.save
        flash[:success] = "Training session successfully created"
        redirect_to user_path(@user)
      else
        flash[:error] = "Something went wrong"
        render 'new'
      end
    end
  end

  private

  def training_params
    params.require(:training).permit(:title, :objectives, :location, :duration, :coach_id, :user_id, movements: [])
  end

end
