class DetalleDevolucionsController < ApplicationController
  before_action :set_detalle_devolucion, only: [:show, :edit, :update, :destroy]

  # GET /detalle_devolucions
  # GET /detalle_devolucions.json
  def index
    @detalle_devolucions = DetalleDevolucion.all
  end

  # GET /detalle_devolucions/1
  # GET /detalle_devolucions/1.json
  def show
  end

  # GET /detalle_devolucions/new
  def new
    @detalle_devolucion = DetalleDevolucion.new
  end

  # GET /detalle_devolucions/1/edit
  def edit
  end

  # POST /detalle_devolucions
  # POST /detalle_devolucions.json
  def create
    @detalle_devolucion = DetalleDevolucion.new(detalle_devolucion_params)

    respond_to do |format|
      if @detalle_devolucion.save
        format.html { redirect_to @detalle_devolucion, notice: 'Detalle devolucion was successfully created.' }
        format.json { render :show, status: :created, location: @detalle_devolucion }
      else
        format.html { render :new }
        format.json { render json: @detalle_devolucion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalle_devolucions/1
  # PATCH/PUT /detalle_devolucions/1.json
  def update
    respond_to do |format|
      if @detalle_devolucion.update(detalle_devolucion_params)
        format.html { redirect_to @detalle_devolucion, notice: 'Detalle devolucion was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalle_devolucion }
      else
        format.html { render :edit }
        format.json { render json: @detalle_devolucion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_devolucions/1
  # DELETE /detalle_devolucions/1.json
  def destroy
    @detalle_devolucion.destroy
    respond_to do |format|
      format.html { redirect_to detalle_devolucions_url, notice: 'Detalle devolucion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_devolucion
      @detalle_devolucion = DetalleDevolucion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_devolucion_params
      params[:detalle_devolucion]
    end
end
