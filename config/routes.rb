Rails.application.routes.draw do
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords,], controllers: {
  registrations: "customers/registrations",
  sessions: 'customers/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
