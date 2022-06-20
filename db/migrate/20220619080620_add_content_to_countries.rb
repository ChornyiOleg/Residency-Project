class AddContentToCountries < ActiveRecord::Migration[7.0]
  def change
    add_column :countries, :content, :text
  end
end
