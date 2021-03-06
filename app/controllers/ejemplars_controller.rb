class EjemplarsController < ApplicationController
  before_action :set_ejemplar, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_vendedor!

  # GET /ejemplars
  # GET /ejemplars.json
  def index
    @ejemplars = Ejemplar.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /ejemplars/1
  # GET /ejemplars/1.json
  def show
  end

  # GET /ejemplars/new
  def new
    if current_vendedor
      if current_vendedor.ES_ADMIN == true
        @ejemplar = Ejemplar.new
      else
        redirect_to root_path, notice: 'No tienes suficientes permisos para entrar acá' and return
      end
    else
      redirect_to root_path, notice: 'No tienes suficientes permisos para entrar acá' and return
    end
  end

  # GET /ejemplars/1/edit
  def edit
  end

  # POST /ejemplars
  # POST /ejemplars.json
  def create
    @ejemplar = Ejemplar.new(ejemplar_params)
    @ejemplar.ID_ESTADO_CLIENTE = 1
    respond_to do |format|
      if @ejemplar.save
        format.html { redirect_to @ejemplar, notice: 'Ejemplar creado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @ejemplar }
      else
        format.html { render :new }
        format.json { render json: @ejemplar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ejemplars/1
  # PATCH/PUT /ejemplars/1.json
  def update
    respond_to do |format|
      if @ejemplar.update(ejemplar_params)
        format.html { redirect_to @ejemplar, notice: 'Ejemplar actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @ejemplar }
      else
        format.html { render :edit }
        format.json { render json: @ejemplar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ejemplars/1
  # DELETE /ejemplars/1.json
  def destroy
    @ejemplar.destroy
    respond_to do |format|
      format.html { redirect_to ejemplars_url, notice: 'Ejemplar eliminado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ejemplar
      @ejemplar = Ejemplar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ejemplar_params
      params.require(:ejemplar).permit(:ID_DISFRAZ, :TALLA_EJEMPLAR, :COLOR_EJEMPLAR, :ESTADO_EJEMPLAR)
    end
end
