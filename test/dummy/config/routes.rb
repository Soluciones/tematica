Rails.application.routes.draw do

  resources :usuarios

  mount Tematica::Engine => "/tematica"
end
