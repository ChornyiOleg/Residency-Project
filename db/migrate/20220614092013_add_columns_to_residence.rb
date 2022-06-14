class AddColumnsToResidence < ActiveRecord::Migration[7.0]
  def change
    add_column :residences, :image, :string
    add_column :residences, :description, :text
  end
end
