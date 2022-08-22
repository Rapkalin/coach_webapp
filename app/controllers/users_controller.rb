class UsersController < HomesController
  skip_before_action :authenticate_user!, only: [:show, :edit]

  def edit
    @user = current_user
  end

  def show
    if current_coach
      @user = User.find(params[:id])
      @passed_trainings = []
      @coming_trainings = []

      @trainings = Training.select('*').where(user_id: @user.id, coach_id: current_coach.id)
      @trainings.reverse_each do |training|
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
