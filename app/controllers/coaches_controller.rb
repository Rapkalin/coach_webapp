class CoachesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :edit]

  def edit
    @coach = current_coach
  end
end
