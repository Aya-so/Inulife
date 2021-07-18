Rails.application.routes.draw do

  # letter_opener_webのルート
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end


  root to: 'public/homes#top'
  resources :maps, only: [:index]                                       #地図

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
    #会員側deviseルーティング
    devise_for :users, controllers: {
      sessions: 'public/users/sessions',
      paswords: 'public/users/paswords',
      registrations: 'public/users/registrations',
    }

    get '/users/:name_id' => 'users#show', as: 'users_show'             #ユーザーページ
    get '/users/edit/:name_id' => 'users#edit', as: 'edit_user'         #ユーザー編集ページ
    patch '/users/update/:name_id' => 'users#update', as: 'update_user' #ユーザー編集ページ

    post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'      #お問い合わせ確認
    post 'contacts/back', to: 'contacts#back', as: 'back'               #お問い合わせ入力誤り
    get 'done', to: 'contacts#done', as: 'done'                         #お問い合わせ完了
    resources :contacts, only: [:new, :create]                          #お問い合わせ

    resources :events, only: [:index, :show]                            #イベント

    resources :posts, only: [:index, :create, :show, :destroy] do       #投稿
      resources :post_comments, only: [:create, :destroy]               #投稿宛コメント
      resource :favorites, only: [:create, :destroy]                    #いいね
    end

    resources :groups do                                                #グループ
      collection do
        post :confirm                                                   #グループ作成確認
      end
      resources :group_users, only: [:create, :destroy,]                #グループユーザー
    end

  end

end
