Rails.application.routes.draw do

  get 'biofile/search'

  get 'masterfile/search'

  mount Blacklight::Engine => '/'
  Blacklight::Marc.add_routes(self)
  root to: "catalog#index"
    concern :searchable, Blacklight::Routes::Searchable.new

  resource :catalog, only: [:index], as: 'catalog', path: '/', controller: 'catalog' do
    concerns :searchable
  end

  resource :masterfile, only: [:search], as: 'masterfile', path: '/masterfile', controller: 'masterfile' do
    concerns :searchable
  end

  resource :biofile, only: [:search], as: 'biofile', path: '/biofile', controller: 'biofile' do
    concerns :searchable
  end

  devise_for :users
  concern :exportable, Blacklight::Routes::Exportable.new

  # resources :solr_documents, only: [:show], path: '/catalog', controller: 'catalog' do
  #   concerns :exportable
  # end

  resources :solr_documents, only: [:show], path: '/masterfile', controller: 'masterfile' do
    concerns :exportable
  end

  resources :solr_documents, only: [:show], path: '/biofile', controller: 'biofile' do
    concerns :exportable
  end

  resources :bookmarks do
    concerns :exportable


    collection do
      delete 'clear'
    end
  end

  get '/masterfile/', to: 'masterfile#search', as: 'masterfile'
  get '/catalog2/', to: 'biofile#search', as: 'biofile'

  get '*path' => redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
