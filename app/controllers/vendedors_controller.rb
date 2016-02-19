class VendedorsController < ApplicationController
  before_action :set_vendedor, only: [:show, :edit, :update, :destroy]
  before_filter :administrador!, only: [:new, :edit, :update, :destroy,:index]
  before_filter :authenticate_vendedor!, only: [:edit, :update]
  # GET /vendedors
  # GET /vendedors.json

  def administrador!
    if current_vendedor
      redirect_to root_path, notice: 'No tienes suficientes permisos para estar acá.' unless current_vendedor.ES_ADMIN == true
    else
      #redirect_to root_path, notice: 'No tienes suficientes permisos para estar acá.' 
    end
  end 

  def index
    @vendedors = Vendedor.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /vendedors/1
  # GET /vendedors/1.json
  def show
  end

  # GET /vendedors/new
  def new
    @vendedor = Vendedor.new
  end

  # GET /vendedors/1/edit
  def edit
  end

  # POST /vendedors
  # POST /vendedors.json
  def create
    @vendedor = Vendedor.new(vendedor_params)

    respond_to do |format|
      if @vendedor.save
        format.html { redirect_to @vendedor, notice: 'Vendedor was successfully created.' }
        format.json { render :show, status: :created, location: @vendedor }
      else
        format.html { render :new }
        format.json { render json: @vendedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendedors/1
  # PATCH/PUT /vendedors/1.json
  def update
    respond_to do |format|
      if @vendedor.update(vendedor_params)
        format.html { redirect_to @vendedor, notice: 'Vendedor was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendedor }
      else
        format.html { render :edit }
        format.json { render json: @vendedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendedors/1
  # DELETE /vendedors/1.json
  def destroy
    @vendedor.destroy
    respond_to do |format|
      format.html { redirect_to vendedors_url, notice: 'Vendedor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendedor
      @vendedor = Vendedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendedor_params
      params.require(:vendedor).permit(:NOMBRE_VENDEDOR,:APELLIDO_VENDEDOR,:RUT_VENDEDOR,:DIRECCION_VENDEDOR,:TELEFONO_VENDEDOR)
    end
end
