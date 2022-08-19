class HomesController < ApplicationController
    def home
    if current_coach
      @users = User.select('users.id', 'users.last_name', 'users.first_name').group(:id, :last_name, :first_name).joins(:trainings).where(trainings: {coach_id: current_coach.id})
    elsif current_user
      @passed_trainings = []
      @coming_trainings = []
      @user = current_user
      @trainings = @user.trainings
      @trainings.each_with_index do |training, index|
        if training.date < Time.now
          @passed_trainings.push(training)
          @passed_trainings
        elsif training.date >= Time.now
          @coming_trainings.push(training)
          @coming_trainings
        end
      end
    end
  end
end
