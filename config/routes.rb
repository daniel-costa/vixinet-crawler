Rails.application.routes.draw do
  
  resources :metadata
  resources :entries
  get 'entries/:id/crawl', to: 'entries#crawl', as: 'crawl_entry'

  resources :platforms do
  	resources :metadata_rules, shallow: true
  end
 
  root 'static_pages#home'
end
