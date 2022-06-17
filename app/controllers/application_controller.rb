class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :set_countries
  before_action :set_programs
  def index

  end

  def set_countries
    @countries = Country.all
  end

  def set_programs
    @programs = Program.all
  end

  around_action :switch_locale

  private

  def switch_locale(&action)
    locale = locale_from_url || I18n.default_locale
    I18n.with_locale locale, &action
  end

  def locale_from_url
    locale = params[:locale]

    return locale if I18n.available_locales.map(&:to_s).include?(locale)
    
    nil
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
