Trestle.resource(:testimonials) do
  menu do
    item :testimonials, icon: 'fa fa-comments'
  end

  # Customize the table columns shown on the index view.
  #
  # table do
  #   column :name
  #   column :created_at, align: :center
  #   actions
  # end

  # Customize the form fields shown on the new/edit views.

  form do |_testimonial|
    text_field :name_of_user_en
    text_field :name_of_user_ru
    text_field :content_en
    text_field :content_ru
  end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:testimonial).permit(:name, ...)
  # end
end
