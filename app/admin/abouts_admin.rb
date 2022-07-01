Trestle.resource(:abouts) do
  menu do
    item :abouts, icon: 'fa fa-info-circle'
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # Customize the form fields shown on the new/edit views.

  form do |_about|
    text_field :title_en
    text_field :title_ru
    text_field :subtitle_en
    text_field :subtitle_ru
    file_field :image
    text_area :advantages_en
    text_area :advantages_ru
    text_area :benefits_en
    text_area :benefits_ru
  end

  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:about).permit(:name, ...)
  # end
end
