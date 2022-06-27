class AddKindToPrograms < ActiveRecord::Migration[7.0]
  def change
    add_column :programs, :kind, :string
  end
end
