class EjemplarEstadosController < ApplicationController
  before_action :set_ejemplar_estado, only: [:show, :edit, :update, :destroy]

  # GET /ejemplar_estados
  # GET /ejemplar_estados.json
  def index
    @ejemplar_estados = EjemplarEstado.all
  end

  # GET /ejemplar_estados/1
  # GET /ejemplar_estados/1.json
  def show
  end

  # GET /ejemplar_estados/new
  def new
    @ejemplar_estado = EjemplarEstado.new
  end

  # GET /ejemplar_estados/1/edit
  def edit
  end

  # POST /ejemplar_estados
  # POST /ejemplar_estados.json
  def create
    @ejemplar_estado = EjemplarEstado.new(ejemplar_estado_params)

    respond_to do |format|
      if @ejemplar_estado.save
        format.html { redirect_to @ejemplar_estado, notice: 'Ejemplar estado was successfully created.' }
        format.json { render :show, status: :created, location: @ejemplar_estado }
      else
        format.html { render :new }
        format.json { render json: @ejemplar_estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ejemplar_estados/1
  # PATCH/PUT /ejemplar_estados/1.json
  def update
    respond_to do |format|
      if @ejemplar_estado.update(ejemplar_estado_params)
        format.html { redirect_to @ejemplar_estado, notice: 'Ejemplar estado was successfully updated.' }
        format.json { render :show, status: :ok, location: @ejemplar_estado }
      else
        format.html { render :edit }
        format.json { render json: @ejemplar_estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ejemplar_estados/1
  # DELETE /ejemplar_estados/1.json
  def destroy
    @ejemplar_estado.destroy
    respond_to do |format|
      format.html { redirect_to ejemplar_estados_url, notice: 'Ejemplar estado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ejemplar_estado
      @ejemplar_estado = EjemplarEstado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ejemplar_estado_params
      params[:ejemplar_estado]
    end
end
