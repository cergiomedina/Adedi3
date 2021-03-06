class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_action :set_carrito!

  def set_carrito!
    if current_cliente
      if session[:cart] then
          @cart = session[:cart]
        else
          @cart = {}
        end
    end
  end

 # protected

  #def configure_permitted_parameters
   # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:nombre_cliente, :email, :password, :password_confirmation, :apellido_cliente,:rut_cliente,:direccion_cliente,:telefono_cliente) }
  	#devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:nombre_cliente, :email, :password, :password_confirmation, :apellido_cliente,:rut_cliente,:direccion_cliente,:telefono_cliente) }
 # end



end
