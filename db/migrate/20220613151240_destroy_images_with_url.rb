class DestroyImagesWithUrl < ActiveRecord::Migration[7.0]
  def change
    remove_column :residences, :image
    remove_column :posts, :image
  end
end
