Rails.application.routes.draw do
  resources :disfrazs

  devise_for :clientes , controllers: { sessions: "clientes/sessions", registrations: "clientes/registrations" }
  devise_for :vendedors , controllers: { sessions: "vendedors/sessions", registrations: "vendedors/registrations" }
  


  get 'home/index'

  get 'home/ayuda'

  get 'home/acerca'

  get 'vendedors/index'

  get 'vendedors/show'

  get 'clientes/:id' => 'clientes#show'

  get 'transicion_arriendos/show'

  get 'pedidos_detalles/show'

  get 'pedido_estados/show'

  get 'pedidos/index'

  get 'pedidos/show'

  get 'parametro_sistemas/index'

  get 'parametro_sistemas/show'

  get 'nota_de_ventas/index'

  get 'nota_de_ventas/show'

  get 'multas/index'

  get 'multas/show'

  get 'log_auditorias/index'

  get 'log_auditorias/show'

  get 'ejemplar_estados/index'

  get 'ejemplars/index'

  get 'ejemplars/show'

  get 'disfrazs/index'

  get 'disfrazs/show'

  get 'devolucions/index'

  get 'devolucions/show'

  get 'detalle_devolucions/show'

  get 'detalle_arriendos/show'

  get 'clientes/index'

  get 'clientes/show'

  get 'categorias/index'

  get 'categoria/new' => 'categorias#new'

  post 'categoria/index' => 'categorias#create'

  get 'categoria/index' => 'categorias#index'

  get '/arriendo_estados' => 'arriendo_estados#index'

  get 'arriendo_estado/new' => 'arriendo_estados#new'



  resources :clientes do
    resources :pedidos, :arriendos, :devolucions
    resource :cliente_estado
  end

  resources :categoria


  resources :categorias do
    resources :disfrazs
  end

  resources :cliente_estados

  resources :arriendos do
    resources :detalle_arriendos,:devolucions
    resource :transicion_est_arriendo, :multa,:nota_de_venta
  end

  resources :devolucions
  resources :disfrazs do
    resources :ejemplars
  end

  resources :ejemplars do
    resource :ejemplar_estado
  end

  resources :ejemplar_estados

  resources :log_auditorias

  resources :multas
  resources :nota_de_ventas

  resources :parametro_sistemas

  resources :pedidos do
    resources :pedidos_detalles
  end

  resources :transicion_arriendos
  resources :transicion_est_arriendos
  resources :transicion_est_ejemplars
  resources :transicion_est_pedidos
  resources :transicion_est_vendedors

  resources :vendedors do
    resources :arriendos, :devolucions
    resource :vendedor_estado
  end


  resources :vendedor_estados

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
