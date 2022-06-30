class CreteTransForAllTables < ActiveRecord::Migration[7.0]
  def up
    About.create_translation_table!({
      title: :string,
      subtitle: :string,
      advantages: :text,
      benefits: :text
    },{
      migrate_data: true
    })

    Country.create_translation_table!({
      name: :string,
      content: :text
    },{
      migrate_data: true
    })

    Post.create_translation_table!({
      name: :string,
      content: :text
    },{
      migrate_data: true
    })

    Program.create_translation_table!({
      name: :string,
      content: :text
    },{
      migrate_data: true
    })

    Testimonial.create_translation_table!({
      name_of_user: :string,
      content: :text
    },{
      migrate_data: true
    })
  end

  def down
    About.drop_translation_table! migrate_data: true
    Country.drop_translation_table! migrate_data: true
    Post.drop_translation_table! migrate_data: true
    Program.drop_translation_table! migrate_data: true
    Testimonial.drop_translation_table! migrate_data: true
  end
end
