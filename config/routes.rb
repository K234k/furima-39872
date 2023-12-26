Rails.application.routes.draw do
  root 'items#index' # ルートパスにアクセスした際にitemsコントローラーのindexアクションを呼び出す
end
