class ChangeNotnullToCustomers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :customers, :is_deleted, false
  end
end
