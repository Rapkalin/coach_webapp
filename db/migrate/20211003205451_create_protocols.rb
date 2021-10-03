class CreateProtocols < ActiveRecord::Migration[6.0]
  def change
    create_table :protocols do |t|
      t.string :name
      t.integer :calcul
      t.references :movement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
