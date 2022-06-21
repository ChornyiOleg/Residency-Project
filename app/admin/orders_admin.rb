Trestle.resource(:orders) do
  menu do
    item :orders, icon: "fa fa-star"
  end

  form do |residence|
  
    text_field :name
    text_field :phone
    text_area :info
    collection_select :residence_id, Residence.order(:name), :id, :name
    select :status, [['New Request', :new_request], ['Completed', :completed]]
    select :messenger, [['Telegram', :telegram], ['Viber', :viber], ['Messenger', :messenger]]
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
  # form do |order|
  #   text_field :name
  #
  #   row do
  #     col { datetime_field :updated_at }
  #     col { datetime_field :created_at }
  #   end
  # end

  # By default, all parameters passed to the update and create actions will be
  # permitted. If you do not have full trust in your users, you should explicitly
  # define the list of permitted parameters.
  #
  # For further information, see the Rails documentation on Strong Parameters:
  #   http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
  #
  # params do |params|
  #   params.require(:order).permit(:name, ...)
  # end
end
