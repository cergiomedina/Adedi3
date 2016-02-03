class TransicionArriendosController < ApplicationController
  before_action :set_transicion_arriendo, only: [:show, :edit, :update, :destroy]

  # GET /transicion_arriendos
  # GET /transicion_arriendos.json
  def index
    @transicion_arriendos = TransicionArriendo.all
  end

  # GET /transicion_arriendos/1
  # GET /transicion_arriendos/1.json
  def show
  end

  # GET /transicion_arriendos/new
  def new
    @transicion_arriendo = TransicionArriendo.new
  end

  # GET /transicion_arriendos/1/edit
  def edit
  end

  # POST /transicion_arriendos
  # POST /transicion_arriendos.json
  def create
    @transicion_arriendo = TransicionArriendo.new(transicion_arriendo_params)

    respond_to do |format|
      if @transicion_arriendo.save
        format.html { redirect_to @transicion_arriendo, notice: 'Transicion arriendo was successfully created.' }
        format.json { render :show, status: :created, location: @transicion_arriendo }
      else
        format.html { render :new }
        format.json { render json: @transicion_arriendo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transicion_arriendos/1
  # PATCH/PUT /transicion_arriendos/1.json
  def update
    respond_to do |format|
      if @transicion_arriendo.update(transicion_arriendo_params)
        format.html { redirect_to @transicion_arriendo, notice: 'Transicion arriendo was successfully updated.' }
        format.json { render :show, status: :ok, location: @transicion_arriendo }
      else
        format.html { render :edit }
        format.json { render json: @transicion_arriendo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transicion_arriendos/1
  # DELETE /transicion_arriendos/1.json
  def destroy
    @transicion_arriendo.destroy
    respond_to do |format|
      format.html { redirect_to transicion_arriendos_url, notice: 'Transicion arriendo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transicion_arriendo
      @transicion_arriendo = TransicionArriendo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transicion_arriendo_params
      params[:transicion_arriendo]
    end
end
