class ViewsController < ApplicationController
  def index
    @views = current_user.views
    @pagy, @records = pagy(@views, items: 10)
  end
end
