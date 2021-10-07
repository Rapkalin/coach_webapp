class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    if current_coach
      @user = User.find(params[:id])
    end
  end
end
