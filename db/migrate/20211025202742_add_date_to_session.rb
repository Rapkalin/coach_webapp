class AddDateToSession < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :date, :date
  end
end
