class DestCol < ActiveRecord::Migration[7.0]
  def change
    remove_column :programs, :type
  end
end
