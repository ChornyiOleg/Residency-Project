class AddToResdences < ActiveRecord::Migration[7.0]
  def change
    add_column :residences, :pros, :text
    add_column :residences, :bedroom, :integer
    add_column :residences, :bathroom, :integer
    add_column :residences, :squarefeet, :float
    add_column :residences, :rooms, :integer
    remove_column :residences, :cost
    add_column :residences, :cost, :string
  end
end
