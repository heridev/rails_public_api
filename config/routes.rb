PublicApi::Application.routes.draw do

  namespace :api do

    resources :kindle_requests, format: :json do
      collection do
        get 'return_kindle'
      end
    end

    resources :kindles, format: :json do
      collection do
        get 'available'
      end
    end

    resources :sessions, only: [], format: :json do
      collection do
        get 'create'
        get 'destroy'
      end
    end
  end
end

