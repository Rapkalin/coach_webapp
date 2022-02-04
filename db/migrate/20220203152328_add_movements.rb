class AddMovements < ActiveRecord::Migration[6.0]
  def change
    add_column :trainings, :movements, :string
  end
end
