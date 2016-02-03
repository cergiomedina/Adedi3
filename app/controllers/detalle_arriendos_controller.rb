class DetalleArriendosController < ApplicationController
  before_action :set_detalle_arriendo, only: [:show, :edit, :update, :destroy]

  # GET /detalle_arriendos
  # GET /detalle_arriendos.json
  def index
    @detalle_arriendos = DetalleArriendo.all
  end

  # GET /detalle_arriendos/1
  # GET /detalle_arriendos/1.json
  def show
  end

  # GET /detalle_arriendos/new
  def new
    @detalle_arriendo = DetalleArriendo.new
  end

  # GET /detalle_arriendos/1/edit
  def edit
  end

  # POST /detalle_arriendos
  # POST /detalle_arriendos.json
  def create
    @detalle_arriendo = DetalleArriendo.new(detalle_arriendo_params)

    respond_to do |format|
      if @detalle_arriendo.save
        format.html { redirect_to @detalle_arriendo, notice: 'Detalle arriendo was successfully created.' }
        format.json { render :show, status: :created, location: @detalle_arriendo }
      else
        format.html { render :new }
        format.json { render json: @detalle_arriendo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detalle_arriendos/1
  # PATCH/PUT /detalle_arriendos/1.json
  def update
    respond_to do |format|
      if @detalle_arriendo.update(detalle_arriendo_params)
        format.html { redirect_to @detalle_arriendo, notice: 'Detalle arriendo was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalle_arriendo }
      else
        format.html { render :edit }
        format.json { render json: @detalle_arriendo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detalle_arriendos/1
  # DELETE /detalle_arriendos/1.json
  def destroy
    @detalle_arriendo.destroy
    respond_to do |format|
      format.html { redirect_to detalle_arriendos_url, notice: 'Detalle arriendo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle_arriendo
      @detalle_arriendo = DetalleArriendo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_arriendo_params
      params[:detalle_arriendo]
    end
end
