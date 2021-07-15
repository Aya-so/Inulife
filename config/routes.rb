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
    resources :users, only: [:index, :show, :edit, :update]             #ユーザー情報
    resources :events do                                                #イベント
      collection do
        post :confirm                                                   #イベント作成確認
      end
    end
    resources :posts, only: [:index, :show, :destroy]                   #投稿
    resources :groups, only: [:index, :show, :edit, :update, :destroy]  #グループ
  end


  #会員側ルーティング
  scope module: 'public' do
    get '/users/:name_id' => 'users#show', as: 'users_show'                  #ユーザーページ
    resource :users, only: [:edit, :update]                             #ユーザー情報
    resources :events, only: [:index, :show]                            #イベント
    resources :posts, only: [:index, :create, :show, :destroy]          #投稿
    resources :groups do                                                #グループ
      collection do
        post :confirm                                                   #グループ作成確認
      end
      resources :group_users, only: [:create, :destroy,]                #グループユーザー
    end

    #会員側deviseルーティング
    devise_for :users, controllers: {
      sessions: 'public/users/sessions',
      paswords: 'public/users/paswords',
      registrations: 'public/users/registrations',
    }
  end

end
