class PedidoEstadosController < ApplicationController
  before_action :set_pedido_estado, only: [:show, :edit, :update, :destroy]

  # GET /pedido_estados
  # GET /pedido_estados.json
  def index
    @pedido_estados = PedidoEstado.all
  end

  # GET /pedido_estados/1
  # GET /pedido_estados/1.json
  def show
  end

  # GET /pedido_estados/new
  def new
    @pedido_estado = PedidoEstado.new
  end

  # GET /pedido_estados/1/edit
  def edit
  end

  # POST /pedido_estados
  # POST /pedido_estados.json
  def create
    @pedido_estado = PedidoEstado.new(pedido_estado_params)

    respond_to do |format|
      if @pedido_estado.save
        format.html { redirect_to @pedido_estado, notice: 'Pedido estado was successfully created.' }
        format.json { render :show, status: :created, location: @pedido_estado }
      else
        format.html { render :new }
        format.json { render json: @pedido_estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedido_estados/1
  # PATCH/PUT /pedido_estados/1.json
  def update
    respond_to do |format|
      if @pedido_estado.update(pedido_estado_params)
        format.html { redirect_to @pedido_estado, notice: 'Pedido estado was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedido_estado }
      else
        format.html { render :edit }
        format.json { render json: @pedido_estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedido_estados/1
  # DELETE /pedido_estados/1.json
  def destroy
    @pedido_estado.destroy
    respond_to do |format|
      format.html { redirect_to pedido_estados_url, notice: 'Pedido estado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido_estado
      @pedido_estado = PedidoEstado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_estado_params
      params[:pedido_estado]
    end
end
