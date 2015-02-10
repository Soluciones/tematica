Rails.application.routes.draw do

  resources :usuarios

  mount Tematica::Engine => '/tematica', as: 'engine_tematica'
end
