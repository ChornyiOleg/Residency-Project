Trestle.resource(:residences) do
  menu do
    item :residences, icon: 'fa fa-home'
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # Customize the form fields shown on the new/edit views.
  #
  # form do |residence|
  #
  #   text_field :name
  #   text_field :address
  #   file_field :image
  #   text_field :cost
  #   text_area :description
  #
  # end
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end
  form do |_residence|
    text_field :name
    text_field :address
    text_field :cost
    text_area :description
    file_field :images, multiple: true
    text_field :pros
    text_field :bedroom
    text_field :bathroom
    text_field :squarefeet
    text_field :rooms
    collection_select :country_id, Country.order(:name), :id, :name
    collection_select :program_id, Program.order(:name), :id, :name
    text_field :latitude
    text_field :longitude
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:residence).permit(:name, ...)
  # end
end
