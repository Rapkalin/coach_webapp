class UsersController < ApplicationController
  def show
    if current_coach
      users = Session.where(coach_id: current_coach.id)

    end
  end
end
