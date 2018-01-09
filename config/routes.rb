Rails.application.routes.draw do

  get 'workers', to: 'worker#index'

  get 'workers/city/:curr', to: "worker#city", as: 'city'

  get 'worker/city'

  get 'main/index'

  resources :worker

  get '/lang/:locale', to: 'main#lang', as: 'lang'

  post '/worker/ajax/', to: "worker#ajax", as: "workerAjax"

  root 'main#index'

end
