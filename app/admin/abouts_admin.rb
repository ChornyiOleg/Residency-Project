Trestle.resource(:abouts) do
  menu do
    item :abouts, icon: "fa fa-info-circle"
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
    text_field :title
    text_field :subtitle
    file_field :image
    text_area :advantages
    text_area :benefits
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
