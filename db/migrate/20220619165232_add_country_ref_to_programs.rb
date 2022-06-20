class AddCountryRefToPrograms < ActiveRecord::Migration[7.0]
  def change
    add_reference :programs, :country, null: false, foreign_key: true
  end
end
