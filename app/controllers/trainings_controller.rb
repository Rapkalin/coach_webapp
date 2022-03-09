require 'date'

class TrainingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :new, :show, :destroy, :edit, :update]

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

  def destroy
    @user = User.find(params["training"]["user_id"])
    @training = Training.find(params[:id])
    @training.destroy
    redirect_to user_path(@user)
  end

  def edit
    @training = Training.find(params[:id])
  end

  def update
    @user = User.find(Training.find(params[:id])[:user_id])
    @training = Training.find(params[:id])
    @training.update(training_params)
    redirect_to user_path(@user)
  end

  private

  def training_params
    params.require(:training).permit(:title, :objectives, :location, :duration, :date, :coach_id, :user_id, movements: [])
  end

end
