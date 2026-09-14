class SetColumnDefaultInServices < ActiveRecord::Migration[8.1]
  def change
    change_column_default :services, :active, from: nil, to: true
  end
end
