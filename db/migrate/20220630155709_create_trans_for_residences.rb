class CreateTransForResidences < ActiveRecord::Migration[7.0]
  def up
    Residence.create_translation_table!({
      name: :string,
      description: :text,
      pros: :text,
      main_info: :text
    },{
      migrate_data: true
    })
  end

  def down
    Residence.drop_translation_table! migrate_data: true
  end
end
