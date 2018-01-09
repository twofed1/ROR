class MainController < ApplicationController
  def index
    %# @workers_list = City.delete([6, 7, 9, 10]) #
  end

  def lang
    cookies[:locale] = params[:locale]
    redirect_to :back
  end

  def add_city
    @city_new = City.create(workers_id: 1, city_name: " ")
    if @city_new.save
      redirect_to :main_index
    end
  end
end
