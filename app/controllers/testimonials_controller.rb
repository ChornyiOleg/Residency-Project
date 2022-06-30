class TestimonialsController < ApplicationController

  def index
    @testimonials = Testimonial.all
    @pagy, @records = pagy(@testimonials, items: 10)
  end
end
