Rails.application.routes.draw do
# A user can see the list of cocktails
root to: "cocktails#index"
resources :cocktails, only: [:index, :new,:show,:create]

# A user can see the details of a given cocktail, with the dose needed for each ingredient
# GET "cocktails/42"
# A user can create a new cocktail
# GET "cocktails/new"
# POST "cocktails"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
