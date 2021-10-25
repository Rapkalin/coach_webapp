class RemoveDateToSession < ActiveRecord::Migration[6.0]
  def change
    remove_column :sessions, :date
  end
end
