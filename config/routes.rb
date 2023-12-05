Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  resources :products, only: [:index, :show] do
    resources :chapters, only: [:show]
    resources :favorites, only: [:new, :create]
  end

  resources :chatrooms, only: [:show, :create, :destroy] do
    resources :messages, only: :create
  end

  post "/gpt_chatrooms", to: "gpt_chatrooms#create"
  resources :gpt_chatrooms, only: [:show, :destroy] do
    resources :gpt_messages, only: :create
  end

  resources :favorites, only: [:index, :destroy]

  # stripe listen --forward-to localhost:3000/stripe/webhooks
  post '/stripe/webhooks', to: 'stripe/webhooks#create'
  post '/stripe/checkout', to: 'stripe/checkout#checkout'
  get '/stripe/checkout/cancel', to: 'stripe/checkout#cancel'
  get '/stripe/checkout/success', to: 'stripe/checkout#success'
  post '/stripe/billing_portal', to: 'stripe/billing_portal#create'
  mount StripeEvent::Engine, at: '/stripe-webhooks'
  # resources :pricing, only: [:pricing]
  get "/profile", to: "users#show"
  # Defines the root path route ("/")
  # root "posts#index"

  get "/chats", to: "users#chats"
  get "/gptchats", to: "users#gptchats"
end
