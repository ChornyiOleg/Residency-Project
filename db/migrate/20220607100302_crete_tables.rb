class CreteTables < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|

      t.timestamps
    end

    add_reference :likes, :residence
    add_reference :likes, :user

    create_table :views do |t|

      t.timestamps
    end
    add_reference :views, :residence
    add_reference :views, :user
  end
end
