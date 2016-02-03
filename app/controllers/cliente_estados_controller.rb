class ClienteEstadosController < ApplicationController
  before_action :set_cliente_estado, only: [:show, :edit, :update, :destroy]

  # GET /cliente_estados
  # GET /cliente_estados.json
  def index
    @cliente_estados = ClienteEstado.all
  end

  # GET /cliente_estados/1
  # GET /cliente_estados/1.json
  def show
  end

  # GET /cliente_estados/new
  def new
    @cliente_estado = ClienteEstado.new
  end

  # GET /cliente_estados/1/edit
  def edit
  end

  # POST /cliente_estados
  # POST /cliente_estados.json
  def create
    @cliente_estado = ClienteEstado.new(cliente_estado_params)

    respond_to do |format|
      if @cliente_estado.save
        format.html { redirect_to @cliente_estado, notice: 'Cliente estado was successfully created.' }
        format.json { render :show, status: :created, location: @cliente_estado }
      else
        format.html { render :new }
        format.json { render json: @cliente_estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cliente_estados/1
  # PATCH/PUT /cliente_estados/1.json
  def update
    respond_to do |format|
      if @cliente_estado.update(cliente_estado_params)
        format.html { redirect_to @cliente_estado, notice: 'Cliente estado was successfully updated.' }
        format.json { render :show, status: :ok, location: @cliente_estado }
      else
        format.html { render :edit }
        format.json { render json: @cliente_estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cliente_estados/1
  # DELETE /cliente_estados/1.json
  def destroy
    @cliente_estado.destroy
    respond_to do |format|
      format.html { redirect_to cliente_estados_url, notice: 'Cliente estado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente_estado
      @cliente_estado = ClienteEstado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_estado_params
      params[:cliente_estado]
    end
end
