class ArriendoEstadosController < ApplicationController
  before_action :set_arriendo_estado, only: [:show, :edit, :update, :destroy]

  # GET /arriendo_estados
  # GET /arriendo_estados.json
  def index
    @arriendo_estados = ArriendoEstado.all
  end

  # GET /arriendo_estados/1
  # GET /arriendo_estados/1.json
  def show
  end

  # GET /arriendo_estados/new
  def new
    @arriendo_estado = ArriendoEstado.new
  end

  # GET /arriendo_estados/1/edit
  def edit
  end

  # POST /arriendo_estados
  # POST /arriendo_estados.json
  def create
    @arriendo_estado = ArriendoEstado.new(arriendo_estado_params)

    respond_to do |format|
      if @arriendo_estado.save
        format.html { redirect_to @arriendo_estado, notice: 'Arriendo estado was successfully created.' }
        format.json { render :show, status: :created, location: @arriendo_estado }
      else
        format.html { render :new }
        format.json { render json: @arriendo_estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arriendo_estados/1
  # PATCH/PUT /arriendo_estados/1.json
  def update
    respond_to do |format|
      if @arriendo_estado.update(arriendo_estado_params)
        format.html { redirect_to @arriendo_estado, notice: 'Arriendo estado was successfully updated.' }
        format.json { render :show, status: :ok, location: @arriendo_estado }
      else
        format.html { render :edit }
        format.json { render json: @arriendo_estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arriendo_estados/1
  # DELETE /arriendo_estados/1.json
  def destroy
    @arriendo_estado.destroy
    respond_to do |format|
      format.html { redirect_to arriendo_estados_url, notice: 'Arriendo estado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arriendo_estado
      @arriendo_estado = ArriendoEstado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def arriendo_estado_params
      params[:arriendo_estado]
    end
end
