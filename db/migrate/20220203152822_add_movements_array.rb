class AddMovementsArray < ActiveRecord::Migration[6.0]
  def change
    remove_column :trainings, :movements
  end
end
