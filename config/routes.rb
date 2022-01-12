Rails.application.routes.draw do
  defaults format: :json do
      resources :report, only: [:create, :index]
  end
end
