Roomie::Application.routes.draw do

  root :to => 'dashboard#index'


  # route to join a dwelling using an invite url
  match 'invites/:token/accpet' => 'invites#accept', :as => 'invites_accept'
  match 'invites/:token' => 'invites#show', :as => 'invites'

	# Dwellings
  resources :dwellings, except: :index do
    resources :invites, :controller => 'dwelling_invites', :except => [:show, :edit, :update]
  end

	# Bills
  get 'payments' => 'bill_payments#history', :as => 'history'
  resources :bills do
    resources :comments
    resources :bill_payments
  end

	# Shopping Lists
  resources :shopping_lists do
    resources :comments
    resources :shopping_list_items
  end

	# Chores
  resources :chores do
		resources :comments
	end

	# Events
  resources :events do
		resources :comments
	end

	# Comments
	resources :comments do
		resources :comments
	end

	# Posts
  resources :posts do
		resources :comments
	end

	# Users and signup
  get 'signup' => 'users#new', :as => 'signup'
  resources :users, :except => [:index, :edit, :update] do
		member do
			get 'settings/account' => 'user_settings#edit_account', as: :account_settings
			put 'settings/account' => 'user_settings#update_account'

			get 'settings/profile' => 'user_settings#edit_profile', as: :profile_settings
			put 'settings/profile' => 'user_settings#update_profile'
		end
	end


	# Login / Logout
  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'login' => 'sessions#new', :as => 'login'
  resources :sessions, :only => [:new, :create, :destroy]

end
