class TestimonialsController < ApplicationController
  before_action :authenticate_user!

  def index
    @testimonials = Testimonial.all
    @pagy, @records = pagy(@testimonials, items: 10)
  end
end
