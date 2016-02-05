class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

#  before_action :configure_permitted_parameters, if: :devise_controller?

 # protected

  #def configure_permitted_parameters
   # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:nombre_cliente, :email, :password, :password_confirmation, :apellido_cliente,:rut_cliente,:direccion_cliente,:telefono_cliente) }
  	#devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:nombre_cliente, :email, :password, :password_confirmation, :apellido_cliente,:rut_cliente,:direccion_cliente,:telefono_cliente) }
 # end
  before_action :configure_new_column_to_devise_permitted_parameters, if: :devise_controller?

  protected

  def configure_new_column_to_devise_permitted_parameters
    registration_params = [:NOMBRE_CLIENTE,:APELLIDO_CLIENTE,:TELEFONO_CLIENTE,:RUT_CLIENTE,:DIRECCION_CLIENTE, :email, :password, :password_confirmation,:ESTADO_CLIENTE]
    if params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    elsif params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    end
  end   
end
