class WorkerController < ApplicationController
  def index
    @workers_list = Worker.all
  end

  def edit
    @new = Worker.select("*").joins(:City)
    @workers_list = City.where (["city_name LIKE ?", "%#{params[:curr]}%"])
  end

  def destroy
    @worker = Worker.find(params[:id])
    @worker.destroy
    redirect_to :worker_index
  end

  def show
    @worker = Worker.find(params[:id])
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

        @user_new = Worker.new(fio: fio, email: email, phone: phone, info: info)
        if @user_new.save
          ret[:code] = 1
          ret[:fio] = @user_new.fio
          ret[:email] = @user_new.email
          ret[:phone] = @user_new.phone
          ret[:info] = @user_new.info
        end
        render json: ret

        else
          render json: ret
    end
  end
end
