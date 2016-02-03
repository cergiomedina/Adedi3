class TransicionEstPedidosController < ApplicationController
  before_action :set_transicion_est_pedido, only: [:show, :edit, :update, :destroy]

  # GET /transicion_est_pedidos
  # GET /transicion_est_pedidos.json
  def index
    @transicion_est_pedidos = TransicionEstPedido.all
  end

  # GET /transicion_est_pedidos/1
  # GET /transicion_est_pedidos/1.json
  def show
  end

  # GET /transicion_est_pedidos/new
  def new
    @transicion_est_pedido = TransicionEstPedido.new
  end

  # GET /transicion_est_pedidos/1/edit
  def edit
  end

  # POST /transicion_est_pedidos
  # POST /transicion_est_pedidos.json
  def create
    @transicion_est_pedido = TransicionEstPedido.new(transicion_est_pedido_params)

    respond_to do |format|
      if @transicion_est_pedido.save
        format.html { redirect_to @transicion_est_pedido, notice: 'Transicion est pedido was successfully created.' }
        format.json { render :show, status: :created, location: @transicion_est_pedido }
      else
        format.html { render :new }
        format.json { render json: @transicion_est_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transicion_est_pedidos/1
  # PATCH/PUT /transicion_est_pedidos/1.json
  def update
    respond_to do |format|
      if @transicion_est_pedido.update(transicion_est_pedido_params)
        format.html { redirect_to @transicion_est_pedido, notice: 'Transicion est pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @transicion_est_pedido }
      else
        format.html { render :edit }
        format.json { render json: @transicion_est_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transicion_est_pedidos/1
  # DELETE /transicion_est_pedidos/1.json
  def destroy
    @transicion_est_pedido.destroy
    respond_to do |format|
      format.html { redirect_to transicion_est_pedidos_url, notice: 'Transicion est pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transicion_est_pedido
      @transicion_est_pedido = TransicionEstPedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transicion_est_pedido_params
      params[:transicion_est_pedido]
    end
end
