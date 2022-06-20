class AddContentToPrograms < ActiveRecord::Migration[7.0]
  def change
    add_column :programs, :content, :text
  end
end
