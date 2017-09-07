# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# See http://andrewberls.com/blog/post/api-versioning-with-rails-4

Rails.application.routes.draw do

  # TODO: comments-staging, comments-uat, etc.
  # TODO: Docker doesn't seem to like subdomains
  # constraints subdomain: 'comments' do
    namespace :v1 do
      get "/", to: "comments#index"
      get "/:id", to: "comments#show", constraints: { id: /\d+/ }
      put "/:id", to: "comments#update"
      delete "/:id", to: "comments#destroy"
      post "/", to: "comments#create"
      get "/docs", to: "docs#index"
    end
  # end

end
