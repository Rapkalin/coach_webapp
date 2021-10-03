class CreateMovements < ActiveRecord::Migration[6.0]
  def change
    create_table :movements do |t|
      t.string :name
      t.string :description
      t.integer :rest_time

      t.timestamps
    end
  end
end
