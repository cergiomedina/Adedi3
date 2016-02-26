class PedidosDetallesController < ApplicationController
  before_action :set_pedidos_detalle, only: [:show, :edit, :update, :destroy]

  # GET /pedidos_detalles
  # GET /pedidos_detalles.json
  def index
    @pedidos_detalles = PedidosDetalle.all
    if current_cliente
      @cliente = current_cliente
      @pedidos = @cliente.pedidos.paginate(:page => params[:page], :per_page => 10)
    end
  end

  # GET /pedidos_detalles/1
  # GET /pedidos_detalles/1.json
  def show
  end

  # GET /pedidos_detalles/new
  def new
    @pedidos_detalle = PedidosDetalle.new
  end

  # GET /pedidos_detalles/1/edit
  def edit
  end

  # POST /pedidos_detalles
  # POST /pedidos_detalles.json
  def create
    @pedidos_detalle = @pedidos.pedidos_detalles.new(pedidos_detalle_params)

    respond_to do |format|
      if @pedidos_detalle.save
        format.html { redirect_to @pedidos_detalle, notice: 'Disfraz añadido.' }
        format.json { render :show, status: :created, location: @pedidos_detalle }
      else
        format.html { render :new }
        format.json { render json: @pedidos_detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos_detalles/1
  # PATCH/PUT /pedidos_detalles/1.json
  def update
    respond_to do |format|
      if @pedidos_detalle.update(pedidos_detalle_params)
        format.html { redirect_to @pedidos_detalle, notice: 'Pedido actualizado.' }
        format.json { render :show, status: :ok, location: @pedidos_detalle }
      else
        format.html { render :edit }
        format.json { render json: @pedidos_detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos_detalles/1
  # DELETE /pedidos_detalles/1.json
  def destroy
    @pedidos_detalle.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_detalles_url, notice: 'El disfraz ha sido eliminado del pedido.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedidos_detalle
      @pedidos_detalle = PedidosDetalle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedidos_detalle_params
      params.require(:pedidos_detalle).permit(:ID_EST_PEDIDO, :FECHA_PEDIDO,:ESTADO_PEDIDO,:cliente_id)
    end
end
