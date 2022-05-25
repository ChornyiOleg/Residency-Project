class DeleteKey < ActiveRecord::Migration[7.0]
  def change
    remove_reference :residences, :order
    add_reference :orders, :residence
  end
end
