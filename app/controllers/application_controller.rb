class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  def set_locale
    I18n.locale = cookies[:locale] || I18n.default_locale
    @cities_menu = City.select(:city_name).map(&:city_name).uniq
  end
end
