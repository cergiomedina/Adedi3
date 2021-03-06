class RegistrationsController < Devise::RegistrationsController
	before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]
  skip_before_filter :require_no_authentication, only: [:new,:create]

  


  def new
    super
  end
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
  # def update
  #   super
  # end

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
   def configure_sign_up_params

     devise_parameter_sanitizer.for(:sign_up) << :NOMBRE_VENDEDOR
     devise_parameter_sanitizer.for(:sign_up) << :APELLIDO_VENDEDOR
     devise_parameter_sanitizer.for(:sign_up) << :DIRECCION_VENDEDOR
     devise_parameter_sanitizer.for(:sign_up) << :RUT_VENDEDOR
     devise_parameter_sanitizer.for(:sign_up) << :TELEFONO_VENDEDOR
     devise_parameter_sanitizer.for(:sign_up) << :ES_ADMIN
   end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.for(:account_update) << :NOMBRE_VENDEDOR
     devise_parameter_sanitizer.for(:account_update) << :APELLIDO_VENDEDOR
     devise_parameter_sanitizer.for(:account_update) << :DIRECCION_VENDEDOR
     devise_parameter_sanitizer.for(:account_update) << :TELEFONO_VENDEDOR
     devise_parameter_sanitizer.for(:account_update) << :ES_ADMIN
   end

end