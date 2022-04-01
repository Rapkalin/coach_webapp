class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :edit]

  def show
    @passed_trainings = []
    @coming_trainings = []
    if current_coach
      # @trainings = training.select('user_id').from('trainings').group(:user_id).where(coach_id: current_coach.id)
      # @trainings = training.select('user_id').from('trainings').where(coach_id: current_coach.id)
      @user = User.find(params[:id])
      @trainings = @user.trainings.where(coach_id: current_coach.id)
      @trainings.each do |training|
        if training.date < Time.now
          @passed_trainings.push(training)
          @passed_trainings
        elsif training.date >= Time.now
          @coming_trainings.push(training)
          @coming_trainings
        end
      end
    elsif current_user
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

  def edit
    @user = current_user
  end

end
