class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :title
      t.string :objectives
      t.string :location
      t.integer :duration
      t.string :results
      t.references :coach, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :movement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
