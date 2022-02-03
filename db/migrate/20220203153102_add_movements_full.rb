class AddMovementsFull < ActiveRecord::Migration[6.0]
  def change
    add_column :trainings, :movements, :string, array: true, default: []
  end
end
