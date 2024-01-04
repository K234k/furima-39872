Rails.application.routes.draw do
  devise_for :users
  root 'items#index' # ルートパスにアクセスした際にitemsコントローラーのindexアクションを呼び出す
end
