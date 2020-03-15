Rails.application.routes.draw do


  #orders controller
  get 'orders', to: 'orders#index', as: 'orders'
  get 'orders/add_to_order_items', as: 'add_to_order_items'
  get 'orders/order_process', to: 'orders#order_process', as: 'order_process'
  get 'orders/increase_item', to: 'orders#increase_item', as: 'increase_item'
  get 'orders/decrease_item', to: 'orders#decrease_item', as: 'decrease_item'
  get 'orders/show/:id', to: 'orders#show', as: 'order_show'
  get 'orders/food_and_set_menu_search', to: 'orders#food_and_set_menu_search', as: 'food_and_set_menu_search'
  get 'orders/destroy_item', to: 'orders#destroy_item', as: 'destroy_item'
  get 'orders/pay_now', to: 'orders#pay_now', as: 'pay_now'
  post 'orders/create_order', to: 'orders#create_order', as: 'create_order'
  post 'orders/create_customer', to: 'orders#create_customer', as: 'create_customer'
  get 'orders/order_print', to: 'orders#order_print', as: 'order_print'
  get 'orders/update_order_status', to: 'orders#update_order_status', as: 'update_order_status'

  # expenses controller
  get 'expenses', to: 'expenses#index', as: 'expenses'
  get 'expense/:id', to: 'expenses#show', as: 'show_expense'
  get 'new', to: 'expenses#new', as: 'new_expense'
  get 'edit/:id', to: 'expenses#edit', as: 'edit_expense'
  patch 'update/:id', to: 'expenses#update', as: 'update_expense'
  delete 'expenses/delete/:id', to: 'expenses#delete', as: 'delete_expense'
  post 'expenses', to: 'expenses#create', as: 'expense'

  # reports_controller

  get 'reports/sales_report', to: 'reports#sales_report', as: 'sales_report'

  #customers controller
  # post 'customers/create', to: 'customers#create', as: 'create_customers'


  resource :orders

  # Devise For active Admin
  devise_for :admin_users, ActiveAdmin::Devise.config

  # Home Controller
  get 'home/index'
  root 'home#index'

  # Devise for employees
  devise_for :employees, controllers: {
      sessions: 'employees/sessions'
  }

  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # devise_for :employees, controllers: {
  #     sessions: 'employees/sessions'
  # }

end
