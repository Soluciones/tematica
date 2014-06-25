Tematica::Engine.routes.draw do
  resources :tematicas do
    post :recuperar, on: :member
  end
end
