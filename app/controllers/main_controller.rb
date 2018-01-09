class MainController < ApplicationController
  def index
  end

  def lang
    cookies[:locale] = params[:locale]
    redirect_to :back
  end

  def add_city
    @city_new = City.create(workers_id: 1, city_name: "Санкт-Петербург")
    if @city_new.save
      redirect_to :main_index
    end
  end
end
