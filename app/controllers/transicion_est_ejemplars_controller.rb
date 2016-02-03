class TransicionEstEjemplarsController < ApplicationController
  before_action :set_transicion_est_ejemplar, only: [:show, :edit, :update, :destroy]

  # GET /transicion_est_ejemplars
  # GET /transicion_est_ejemplars.json
  def index
    @transicion_est_ejemplars = TransicionEstEjemplar.all
  end

  # GET /transicion_est_ejemplars/1
  # GET /transicion_est_ejemplars/1.json
  def show
  end

  # GET /transicion_est_ejemplars/new
  def new
    @transicion_est_ejemplar = TransicionEstEjemplar.new
  end

  # GET /transicion_est_ejemplars/1/edit
  def edit
  end

  # POST /transicion_est_ejemplars
  # POST /transicion_est_ejemplars.json
  def create
    @transicion_est_ejemplar = TransicionEstEjemplar.new(transicion_est_ejemplar_params)

    respond_to do |format|
      if @transicion_est_ejemplar.save
        format.html { redirect_to @transicion_est_ejemplar, notice: 'Transicion est ejemplar was successfully created.' }
        format.json { render :show, status: :created, location: @transicion_est_ejemplar }
      else
        format.html { render :new }
        format.json { render json: @transicion_est_ejemplar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transicion_est_ejemplars/1
  # PATCH/PUT /transicion_est_ejemplars/1.json
  def update
    respond_to do |format|
      if @transicion_est_ejemplar.update(transicion_est_ejemplar_params)
        format.html { redirect_to @transicion_est_ejemplar, notice: 'Transicion est ejemplar was successfully updated.' }
        format.json { render :show, status: :ok, location: @transicion_est_ejemplar }
      else
        format.html { render :edit }
        format.json { render json: @transicion_est_ejemplar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transicion_est_ejemplars/1
  # DELETE /transicion_est_ejemplars/1.json
  def destroy
    @transicion_est_ejemplar.destroy
    respond_to do |format|
      format.html { redirect_to transicion_est_ejemplars_url, notice: 'Transicion est ejemplar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transicion_est_ejemplar
      @transicion_est_ejemplar = TransicionEstEjemplar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transicion_est_ejemplar_params
      params[:transicion_est_ejemplar]
    end
end
