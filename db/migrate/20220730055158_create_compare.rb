class CreateCompare < ActiveRecord::Migration[7.0]
  def change
    create_table :compares do |t|
      t.timestamps
    end

    add_reference :compares, :residence
    add_reference :compares, :user
  end
end
