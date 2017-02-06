Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "events#index"
  #match ':controller(/:action(/:id(.:format)))', :via => :all
  resources :events do
    resources :attendees, :controller => 'event_attendees'
  end
end
