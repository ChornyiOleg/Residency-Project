class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
    @pagy, @contacts = pagy(Contact.order(created_at: :desc), items: 5)
  end

  def show; end
end
