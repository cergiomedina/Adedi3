class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]
  before_action :cliente_o_vendedor!

  def cliente_o_vendedor!
    redirect_to root_path , notice: 'No tienes suficientes permisos para estar acá.' unless current_cliente || current_vendedor
  end 
  # GET /pedidos
  # GET /pedidos.json
  def index

    @pedidos = Pedido.all.paginate(:page => params[:page], :per_page => 10).order('FECHA_PEDIDO DESC')
    if current_cliente
      @cliente = current_cliente
      @pedidos = @cliente.pedidos.paginate(:page => params[:page], :per_page => 10).order('FECHA_PEDIDO DESC')
    end
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
    @pedido = Pedido.find(params[:id])
    #respond_with(@pedido)
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new

  end

  def aceptarPedido
    salida = false
    if current_vendedor
      @pedido = Pedido.find(params[:id])
      @cliente = Cliente.find(@pedido.cliente_id)
      ActiveRecord::Base.transaction do
          @total_arriendo = 0
          @cantidad_disfraces = 0

          @pedido.pedidos_detalles.each do |disfraz|
            @total_arriendo += disfraz.precio_detalle
            @cantidad_disfraces += disfraz.cantidad
          end
          #params.require(:pedido).permit(:ID_EST_PEDIDO, :FECHA_PEDIDO,:ESTADO_PEDIDO,:cliente_id)
          @pedido.ESTADO_PEDIDO = 'ACEPTADO'
          respuesta = @pedido.save!
          @arriendo = @cliente.arriendos.new(ID_EST_ARRIENDO: 1, ID_VENDEDOR: current_vendedor.id, ID_PEDIDO: @pedido.id,NUMERO_DISFRACES: @cantidad_disfraces,FECHA_ARRIENDO: Time.now,ESTADO_ARRIENDO: 'ARRENDADO', TOTAL_ARRIENDO: @total_arriendo, TOTAL_GARANTIA: @total_arriendo )
          respuesta1 = @arriendo.save!
         
            
          if respuesta1 and respuesta
            redirect_to '/arriendos', notice: 'El pedido ha pasado a ser Arrendado con éxito!.'
          else
            salida = true 
            raise ActiveRecord::Rollback
          end
      end      
    else
      if salida == false
        redirect_to root_path, notice: 'No tienes suficientes permisos realizar esta acción' and return
      end
    end
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = current_cliente.pedidos.new(pedido_params)

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to @pedido, notice: 'Nuevo pedido ha sido creado' }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: 'El pedido ha sido modificado.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'El pedido ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:ID_EST_PEDIDO, :FECHA_PEDIDO,:ESTADO_PEDIDO,:cliente_id,:cantidad )
    end
end
