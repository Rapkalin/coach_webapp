class AddCoordinatesToTrainings < ActiveRecord::Migration[6.0]
  def change
    add_column :trainings, :latitude, :float
    add_column :trainings, :longitude, :float
  end
end
