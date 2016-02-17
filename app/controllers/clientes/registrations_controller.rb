class Clientes::RegistrationsController < Devise::RegistrationsController
 before_filter :configure_sign_up_params, only: [:create]
 before_filter :configure_account_update_params, only: [:update]
 before_filter :configure_permitted_parameters
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
   def update
     super
   end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u|
      u.permit(:email, :password, :password_confirmation, :NOMBRE_CLIENTE, :APELLIDO_CLIENTE, :DIRECCION_CLIENTE, :RUT_CLIENTE, :TELEFONO_CLIENTE)
    }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :NOMBRE_CLIENTE, :APELLIDO_CLIENTE,:DIRECCION_CLIENTE,:TELEFONO_CLIENTE) }
  end


   def configure_sign_up_params

     devise_parameter_sanitizer.for(:sign_up) << :NOMBRE_CLIENTE
     devise_parameter_sanitizer.for(:sign_up) << :APELLIDO_CLIENTE
     devise_parameter_sanitizer.for(:sign_up) << :DIRECCION_CLIENTE
     devise_parameter_sanitizer.for(:sign_up) << :RUT_CLIENTE
     devise_parameter_sanitizer.for(:sign_up) << :TELEFONO_CLIENTE
   end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.for(:account_update) << :NOMBRE_CLIENTE
     devise_parameter_sanitizer.for(:account_update) << :APELLIDO_CLIENTE
     devise_parameter_sanitizer.for(:account_update) << :DIRECCION_CLIENTE
     devise_parameter_sanitizer.for(:account_update) << :TELEFONO_CLIENTE
     
   end


  # The path used after sign up.
   def after_sign_up_path_for(resource)
     redirect_to disfrazs_path
   end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end