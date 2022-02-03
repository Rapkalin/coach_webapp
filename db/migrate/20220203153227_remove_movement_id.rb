class RemoveMovementId < ActiveRecord::Migration[6.0]
  def change
    remove_column :trainings, :movement_id
  end
end
