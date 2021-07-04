Rails.application.routes.draw do

  root to: 'public/homes#top'

  #管理者側deviseルーティング
  devise_for :admins, controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  #顧客側deviseルーティング
  devise_for :users, controllers: {
    sessions: 'public/users/sessions',
    paswords: 'public/users/paswords',
    registrations: 'public/users/registrations',
  }

end
