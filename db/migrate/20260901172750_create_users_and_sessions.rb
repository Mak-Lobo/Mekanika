class CreateUsersAndSessions < ActiveRecord::Migration[8.1]
  def change
    create_table :users_and_sessions do |t|
      t.timestamps
    end
  end
end
