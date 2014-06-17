Rails.application.routes.draw do

  resources :cosas

  resources :usuarios

  mount Tematica::Engine => "/tematica"
end
