Summaries::Application.routes.draw do
  get "/auth/:provider/callback", :to => "sessions#create"
  delete "/sign_out", :to => "sessions#destroy", :as => "sessions"

  resources :summaries, :only => [:index, :new, :create, :show, :edit, :update]

  root "welcome#index"
end
