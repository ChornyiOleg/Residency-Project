Trestle.resource(:programs) do
  menu do
    item :programs, icon: 'fa fa-star'
  end

  # Customize the table columns shown on the index view.
  #
  table do
    column :name
    column :content
    column :created_at, align: :center
  end

  # Customize the form fields shown on the new/edit views.
  #
  form do |_program|
    text_field :name_en
    text_field :name_ru
    text_area :content_en
    text_area :content_ru
    file_field :image
    text_field :kind, placeholder: 'Citizenship or Residency'
    collection_select :country_id, Country.order(:name), :id, :name
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:program).permit(:name, ...)
  # end
end
