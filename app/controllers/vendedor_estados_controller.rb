class VendedorEstadosController < ApplicationController
  before_action :set_vendedor_estado, only: [:show, :edit, :update, :destroy]

  # GET /vendedor_estados
  # GET /vendedor_estados.json
  def index
    @vendedor_estados = VendedorEstado.all
  end

  # GET /vendedor_estados/1
  # GET /vendedor_estados/1.json
  def show
  end

  # GET /vendedor_estados/new
  def new
    @vendedor_estado = VendedorEstado.new
  end

  # GET /vendedor_estados/1/edit
  def edit
  end

  # POST /vendedor_estados
  # POST /vendedor_estados.json
  def create
    @vendedor_estado = VendedorEstado.new(vendedor_estado_params)

    respond_to do |format|
      if @vendedor_estado.save
        format.html { redirect_to @vendedor_estado, notice: 'Vendedor estado was successfully created.' }
        format.json { render :show, status: :created, location: @vendedor_estado }
      else
        format.html { render :new }
        format.json { render json: @vendedor_estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendedor_estados/1
  # PATCH/PUT /vendedor_estados/1.json
  def update
    respond_to do |format|
      if @vendedor_estado.update(vendedor_estado_params)
        format.html { redirect_to @vendedor_estado, notice: 'Vendedor estado was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendedor_estado }
      else
        format.html { render :edit }
        format.json { render json: @vendedor_estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendedor_estados/1
  # DELETE /vendedor_estados/1.json
  def destroy
    @vendedor_estado.destroy
    respond_to do |format|
      format.html { redirect_to vendedor_estados_url, notice: 'Vendedor estado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendedor_estado
      @vendedor_estado = VendedorEstado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendedor_estado_params
      params[:vendedor_estado]
    end
end
