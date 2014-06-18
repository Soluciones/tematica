Tematica::Engine.routes.draw do
  resources :tematicas do
    post :recuperar, on: :member
  end

  resources :tematizaciones

  get 'tematizar/:tematizable_class/:tematizable_id' => 'tematizaciones#tematizar'
end
