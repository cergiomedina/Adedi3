class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]
  before_action :cliente_o_vendedor!

  def cliente_o_vendedor!
    redirect_to root_path , notice: 'No tienes suficientes permisos para estar acá.' unless current_cliente || current_vendedor
  end 
  # GET /pedidos
  # GET /pedidos.json
  def index

    @pedidos = Pedido.all
    if current_cliente
      @cliente = current_cliente
      @pedidos = @cliente.pedidos.paginate(:page => params[:page], :per_page => 10)
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
      params.require(:pedido).permit(:ID_EST_PEDIDO, :FECHA_PEDIDO,:ESTADO_PEDIDO,:cliente_id)
    end
end
