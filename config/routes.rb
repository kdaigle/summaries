Summaries::Application.routes.draw do
  get "/auth/:provider/callback", :to => "sessions#create"
  delete "/sign_out", :to => "sessions#destroy", :as => "sessions"
  root "welcome#index"
end
