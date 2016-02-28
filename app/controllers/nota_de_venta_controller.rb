class NotaDeVentaController < ApplicationController
  before_action :set_nota_de_ventum, only: [:show, :edit, :update, :destroy]

  # GET /nota_de_venta
  # GET /nota_de_venta.json
  def index
    @nota_de_venta = NotaDeVentum.all
  end

  # GET /nota_de_venta/1
  # GET /nota_de_venta/1.json
  def show
  end

  # GET /nota_de_venta/new
  def new
    @nota_de_ventum = NotaDeVentum.new
  end

  # GET /nota_de_venta/1/edit
  def edit
  end

  # POST /nota_de_venta
  # POST /nota_de_venta.json
  def create
    @nota_de_ventum = NotaDeVentum.new(nota_de_ventum_params)

    respond_to do |format|
      if @nota_de_ventum.save
        format.html { redirect_to @nota_de_ventum, notice: 'Nota de ventum was successfully created.' }
        format.json { render :show, status: :created, location: @nota_de_ventum }
      else
        format.html { render :new }
        format.json { render json: @nota_de_ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nota_de_venta/1
  # PATCH/PUT /nota_de_venta/1.json
  def update
    respond_to do |format|
      if @nota_de_ventum.update(nota_de_ventum_params)
        format.html { redirect_to @nota_de_ventum, notice: 'Nota de ventum was successfully updated.' }
        format.json { render :show, status: :ok, location: @nota_de_ventum }
      else
        format.html { render :edit }
        format.json { render json: @nota_de_ventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nota_de_venta/1
  # DELETE /nota_de_venta/1.json
  def destroy
    @nota_de_ventum.destroy
    respond_to do |format|
      format.html { redirect_to nota_de_venta_url, notice: 'Nota de ventum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nota_de_ventum
      @nota_de_ventum = NotaDeVentum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nota_de_ventum_params
      params.require(:nota_de_ventum).permit(:ID_DEVOLUCION,:TOTAL_NOTA)
    end
end
