class CreateOrder < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :phone
      t.text :info

      t.timestamps
    end

    add_reference :orders, :user
    add_reference :residences, :order
  end
end
