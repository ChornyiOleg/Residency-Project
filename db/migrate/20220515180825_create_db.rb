class CreateDb < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :name

      t.timestamps
    end

    create_table :programs do |t|
      t.string :name
      t.string :type

      t.timestamps
    end

    create_table :residences do |t|
      t.string :name
      t.string :address
      t.string :image
      t.float :cost

      t.timestamps
    end

    create_table :posts do |t|
      t.string :name
      t.string :image
      t.text :content

      t.timestamps
    end

    add_reference :residences, :country
    add_reference :residences, :program

  end
end
