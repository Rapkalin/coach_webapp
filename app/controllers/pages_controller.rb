class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    if current_coach
      @sessions = Session.where(coach_id: current_coach.id)
    end
  end
end
