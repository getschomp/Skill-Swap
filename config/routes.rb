Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
 authenticated :user do
   root 'users#index'
 end

 unauthenticated :user do
   devise_scope :user do
     get "/" => "devise/sessions#new"
   end
 end

  resources :users do
    resources :user_skills, as: :skill_relationships, path: "skill_relationships" do
      collection do
        get :new_wanted
        post :create_wanted
        get :edit_wanted
        post :update_wanted
      end
    end
  end

  resources :skills

  resources :conversations do
    resources :messages
  end

end
