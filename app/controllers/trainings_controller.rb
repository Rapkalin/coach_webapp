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
      @training.save
      raise # Check out to get the user id
      if @training.save
        flash[:success] = "Training session successfully created"
        redirect_to root_path
      else
        flash[:error] = "Something went wrong"
        render 'new'
      end
    end
  end

  private

  def training_params
    params.require(:training).permit(:title, :objectives, :location, :duration, :results, :movement_id, :coach_id, :user_id)
  end

end
