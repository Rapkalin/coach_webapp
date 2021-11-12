class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create, :new]

  def new
    if current_coach
      @coach = current_coach
      @session = Session.new
    end
  end

  def create
    if current_coach
      @coach = current_coach
      @user = User.find(params[:id])
      @session = Session.new(session_params)
      @session.save
      raise # Check out to get the user id
      if @session.save
        flash[:success] = "Session successfully created"
        redirect_to root_path
      else
        flash[:error] = "Something went wrong"
        render 'new'
      end
    end
  end

  private

  def session_params
    params.require(:session).permit(:title, :objectives, :location, :duration, :results, :movement_id, :coach_id, :user_id)
  end

end
