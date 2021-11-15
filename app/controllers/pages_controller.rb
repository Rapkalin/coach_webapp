class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    if current_coach
      # @trainings = training.where(coach_id: current_coach.id)
      @trainings = Training.select('user_id').from('trainings').group(:user_id).where(coach_id: current_coach.id)
    end
  end
end
