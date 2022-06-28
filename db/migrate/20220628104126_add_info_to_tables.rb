class AddInfoToTables < ActiveRecord::Migration[7.0]
  def change
    add_column :residences, :main_info, :text
    add_column :administrators, :super_admin, :integer, default: 0
  end
end
