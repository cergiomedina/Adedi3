class TransicionEstClientesController < ApplicationController
  before_action :set_transicion_est_cliente, only: [:show, :edit, :update, :destroy]

  # GET /transicion_est_clientes
  # GET /transicion_est_clientes.json
  def index
    @transicion_est_clientes = TransicionEstCliente.all
  end

  # GET /transicion_est_clientes/1
  # GET /transicion_est_clientes/1.json
  def show
  end

  # GET /transicion_est_clientes/new
  def new
    @transicion_est_cliente = TransicionEstCliente.new
  end

  # GET /transicion_est_clientes/1/edit
  def edit
  end

  # POST /transicion_est_clientes
  # POST /transicion_est_clientes.json
  def create
    @transicion_est_cliente = TransicionEstCliente.new(transicion_est_cliente_params)

    respond_to do |format|
      if @transicion_est_cliente.save
        format.html { redirect_to @transicion_est_cliente, notice: 'Transicion est cliente was successfully created.' }
        format.json { render :show, status: :created, location: @transicion_est_cliente }
      else
        format.html { render :new }
        format.json { render json: @transicion_est_cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transicion_est_clientes/1
  # PATCH/PUT /transicion_est_clientes/1.json
  def update
    respond_to do |format|
      if @transicion_est_cliente.update(transicion_est_cliente_params)
        format.html { redirect_to @transicion_est_cliente, notice: 'Transicion est cliente was successfully updated.' }
        format.json { render :show, status: :ok, location: @transicion_est_cliente }
      else
        format.html { render :edit }
        format.json { render json: @transicion_est_cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transicion_est_clientes/1
  # DELETE /transicion_est_clientes/1.json
  def destroy
    @transicion_est_cliente.destroy
    respond_to do |format|
      format.html { redirect_to transicion_est_clientes_url, notice: 'Transicion est cliente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transicion_est_cliente
      @transicion_est_cliente = TransicionEstCliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transicion_est_cliente_params
      params[:transicion_est_cliente]
    end
end
