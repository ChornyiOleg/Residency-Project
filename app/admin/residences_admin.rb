Trestle.resource(:residences) do
  menu do
    item :residences, icon: "fa fa-star"
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
  form do |residence|
  
    row do
      text_field :name
      text_field :address
      text_field :cost
      file_field :images, multiple: true
      collection_select :country_id, Country.order(:name), :id, :name
      collection_select :program_id, Program.order(:name), :id, :name
    end
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
