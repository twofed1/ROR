class WorkerController < ApplicationController
  def index
    @workers_list = Worker.joins("INNER JOIN cities ON cities.workers_id = workers.id").select("cities.*,workers.*").all
  end

  def destroy
    @worker = Worker.joins("INNER JOIN cities ON cities.workers_id = workers.id").select("cities.*,workers.*").find(params[:id])
    @worker.destroy
    redirect_to :worker_index
  end

  def show
    @worker = Worker.joins("INNER JOIN cities ON cities.workers_id = workers.id").select("cities.*,workers.*").find(params[:id])
  end

  def city
    @workers_city_list = Worker.joins("INNER JOIN cities ON cities.workers_id = workers.id").select("cities.*,workers.*").where(cities: {city_name: params[:curr]})
  end

  def ajax
    type = params[:type]
    ret = {'code': 0}

    case type
      when 'add'
        fio = params[:fio]
        email = params[:email]
        phone = params[:phone]
        info = params[:info]
        city = params[:city]
        image = params[:image]

        @user_new = Worker.new(fio: fio, email: email, phone: phone, info: info, photo_url: image)
        if @user_new.save
          @city_new = City.new(workers_id: @user_new.id, city_name: city)
            if @city_new.save
              ret[:code] = 1
              ret[:fio] = @user_new.fio
              ret[:email] = @user_new.email
              ret[:phone] = @user_new.phone
              ret[:info] = @user_new.info
              ret[:city] = @city_new.city_name
              ret[:image] = @user_new.photo_url
            end
        end
        render json: ret

        else
          render json: ret
    end
  end
end
