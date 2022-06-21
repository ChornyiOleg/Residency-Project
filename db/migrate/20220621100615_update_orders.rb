class UpdateOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :status, :integer, default: 0
    add_column :orders, :messenger, :integer, default: 0
  end
end
