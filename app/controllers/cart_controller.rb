class CartController < ApplicationController

	before_action :authenticate_cliente!, except: [:index]

	def add
		id = params[:id]
		if session[:cart] then
			cart = session[:cart]
		else
			session[:cart] = {}
			cart = session[:cart]
		end

		if cart[id] then
			cart[id] = cart[id] + 1
		else
			cart[id] = 1
		end

		redirect_to '/carrito' , notice: 'El disfraz ha sido agregado a tu carro de arriendos.' 

	end

	def clearCart
		session[:cart] = nil
		redirect_to :action => :index
	end	

	def eliminardisfraz

		id = params[:id]
		if session[:cart] then
			cart = session[:cart]
		else
			session[:cart] = {}
			cart = session[:cart]
		end

		if cart[id] then
			cart.delete(id)
		end
		redirect_to '/carrito', notice: 'El disfraz se ha eliminado de tu carrito de arriendos'
	end

	  def index
	  	
	  	if session[:cart] then
	  		@cart = session[:cart]
	  	else
	  		@cart = {}
	  	end

	  end

	  def anadirdisfraz
	  	id = params[:id]
		if session[:cart] then
			cart = session[:cart]
		else
			session[:cart] = {}
			cart = session[:cart]
		end
		cart[id] = cart[id] + 1	
		redirect_to '/carrito', notice: 'Se ha añadido una prenda más del disfraz seleccionado.'
	  end

	  def quitardisfraz
	  	id = params[:id]
		if session[:cart] then
			cart = session[:cart]
		else
			session[:cart] = {}
			cart = session[:cart]
		end

		if cart[id] == 1
			redirect_to '/carrito', notice: 'No se puede seguir disminuyendo la cantidad de disfraces.'
		end
	  	cart[id] = cart[id] - 1
	  	redirect_to '/carrito', notice: 'Se ha disminuido una prenda del disfraz seleccionado.'
	  end

	  def solicitar

	  	if session[:cart] then
			@cart = session[:cart]

			ActiveRecord::Base.transaction do
					#params.require(:pedido).permit(:ID_EST_PEDIDO, :FECHA_PEDIDO,:ESTADO_PEDIDO,:cliente_id)
					@pedido = current_cliente.pedidos.new(ID_EST_PEDIDO: 1, FECHA_PEDIDO: Time.now, ESTADO_PEDIDO:'EN ESPERA')
					respuesta1 = @pedido.save!
					respuesta2 = true
					@cart.each do |disfraz|
						@pedidos_detalles = @pedido.pedidos_detalles.new(FECHA_RETIRO: Time.new,cantidad: disfraz[1],FECHA_DEV: Time.new,disfraz_id: disfraz[0], precio_detalle: Disfraz.find(disfraz[0]).precio * disfraz[1])
						respuesta2 = respuesta2 and @pedidos_detalles.save!						
					end			
					if respuesta1 and respuesta2
						session[:cart] = nil
						redirect_to '/pedidos', notice: 'El pedido se ha realizado con éxito.'
					else
						raise ActiveRecord::Rollback
					end
			end
		else
			
		end

	  end


end
