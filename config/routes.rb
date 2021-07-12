Rails.application.routes.draw do

  root to: 'public/homes#top'

  #管理者側deviseルーティング
  devise_for :admins, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  #管理者側ルーティング
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]           #ユーザー情報
    post '/events/confirm' => 'events#confirm'                        #イベント確認
    resources :events                                                 #イベント
    resources :posts, only: [:index, :show, :destroy]                 #投稿
  end


  #会員側ルーティング
  scope module: 'public' do
    get '/users/my_page' => 'users#show', as: 'my_page'               #ユーザーマイページ
    resource :users, only: [:edit, :update]                           #ユーザー情報
    resources :events, only: [:index, :show]                          #イベント
    resources :posts, only: [:create, :show, :destroy]                #投稿

    #会員側deviseルーティング
    devise_for :users, controllers: {
      sessions: 'public/users/sessions',
      paswords: 'public/users/paswords',
      registrations: 'public/users/registrations',
    }
  end

end
