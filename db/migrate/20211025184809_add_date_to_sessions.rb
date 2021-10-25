class AddDateToSessions < ActiveRecord::Migration[6.0]
  def change
      add_column :sessions, :date, :datetime
  end
end
