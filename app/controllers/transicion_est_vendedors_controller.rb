class TransicionEstVendedorsController < ApplicationController
  before_action :set_transicion_est_vendedor, only: [:show, :edit, :update, :destroy]

  # GET /transicion_est_vendedors
  # GET /transicion_est_vendedors.json
  def index
    @transicion_est_vendedors = TransicionEstVendedor.all
  end

  # GET /transicion_est_vendedors/1
  # GET /transicion_est_vendedors/1.json
  def show
  end

  # GET /transicion_est_vendedors/new
  def new
    @transicion_est_vendedor = TransicionEstVendedor.new
  end

  # GET /transicion_est_vendedors/1/edit
  def edit
  end

  # POST /transicion_est_vendedors
  # POST /transicion_est_vendedors.json
  def create
    @transicion_est_vendedor = TransicionEstVendedor.new(transicion_est_vendedor_params)

    respond_to do |format|
      if @transicion_est_vendedor.save
        format.html { redirect_to @transicion_est_vendedor, notice: 'Transicion est vendedor was successfully created.' }
        format.json { render :show, status: :created, location: @transicion_est_vendedor }
      else
        format.html { render :new }
        format.json { render json: @transicion_est_vendedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transicion_est_vendedors/1
  # PATCH/PUT /transicion_est_vendedors/1.json
  def update
    respond_to do |format|
      if @transicion_est_vendedor.update(transicion_est_vendedor_params)
        format.html { redirect_to @transicion_est_vendedor, notice: 'Transicion est vendedor was successfully updated.' }
        format.json { render :show, status: :ok, location: @transicion_est_vendedor }
      else
        format.html { render :edit }
        format.json { render json: @transicion_est_vendedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transicion_est_vendedors/1
  # DELETE /transicion_est_vendedors/1.json
  def destroy
    @transicion_est_vendedor.destroy
    respond_to do |format|
      format.html { redirect_to transicion_est_vendedors_url, notice: 'Transicion est vendedor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transicion_est_vendedor
      @transicion_est_vendedor = TransicionEstVendedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transicion_est_vendedor_params
      params[:transicion_est_vendedor]
    end
end
