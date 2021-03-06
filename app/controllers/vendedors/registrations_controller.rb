class Vendedors::RegistrationsController < Devise::RegistrationsController

  before_filter :configure_sign_up_params, only: [:create]
  before_filter :configure_account_update_params, only: [:update]
  skip_before_action :require_no_authentication, only: [:new, :create, :cancel]
  before_action :authenticate_vendedor!
  def new
    super
  end
  # GET /resource/sign_up
   def new
    if current_vendedor
      if current_vendedor.ES_ADMIN == true

        super
      else
        redirect_to root_path, notice: 'No tienes permisos para entrar a esta ubicación' and return
      end
   else
    redirect_to root_path, notice: 'No tienes permisos para entrar a esta ubicación' and return
    end
   end

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


  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
