class ViewsController < ApplicationController
  def index
    @views = View.where(user: current_user)
    @pagy, @records = pagy(@views, items: 10)
  end
end
