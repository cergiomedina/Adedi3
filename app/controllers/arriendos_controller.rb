class ArriendosController < ApplicationController
  before_action :set_arriendo, only: [:show, :edit, :update, :destroy]

  # GET /arriendos
  # GET /arriendos.json
  def index
    @arriendos = Arriendo.all
  end

  # GET /arriendos/1
  # GET /arriendos/1.json
  def show
  end

  # GET /arriendos/new
  def new
    @arriendo = Arriendo.new
  end

  # GET /arriendos/1/edit
  def edit
  end

  # POST /arriendos
  # POST /arriendos.json
  def create
    @arriendo = Arriendo.new(arriendo_params)

    respond_to do |format|
      if @arriendo.save
        format.html { redirect_to @arriendo, notice: 'Arriendo was successfully created.' }
        format.json { render :show, status: :created, location: @arriendo }
      else
        format.html { render :new }
        format.json { render json: @arriendo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arriendos/1
  # PATCH/PUT /arriendos/1.json
  def update
    respond_to do |format|
      if @arriendo.update(arriendo_params)
        format.html { redirect_to @arriendo, notice: 'Arriendo was successfully updated.' }
        format.json { render :show, status: :ok, location: @arriendo }
      else
        format.html { render :edit }
        format.json { render json: @arriendo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arriendos/1
  # DELETE /arriendos/1.json
  def destroy
    @arriendo.destroy
    respond_to do |format|
      format.html { redirect_to arriendos_url, notice: 'Arriendo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arriendo
      @arriendo = Arriendo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def arriendo_params
      params[:arriendo]
    end
end
