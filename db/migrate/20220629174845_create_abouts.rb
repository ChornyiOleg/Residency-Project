class CreateAbouts < ActiveRecord::Migration[7.0]
  def change
    create_table :abouts do |t|
      t.string :title
      t.string :subtitle
      t.text :advantages
      t.text :benefits

      t.timestamps
    end
  end
end
