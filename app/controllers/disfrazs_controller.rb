class DisfrazsController < ApplicationController
  before_action :set_disfraz, only: [:show, :edit, :update, :destroy]

  # GET /disfrazs
  # GET /disfrazs.json
  def index
    @disfrazs = Disfraz.all
  end

  # GET /disfrazs/1
  # GET /disfrazs/1.json
  def show
  end

  # GET /disfrazs/new
  def new
    @disfraz = Disfraz.new
  end

  # GET /disfrazs/1/edit
  def edit
  end

  # POST /disfrazs
  # POST /disfrazs.json
  def create
    @disfraz = Disfraz.new(disfraz_params)

    respond_to do |format|
      if @disfraz.save
        format.html { redirect_to @disfraz, notice: 'Disfraz was successfully created.' }
        format.json { render :show, status: :created, location: @disfraz }
      else
        format.html { render :new }
        format.json { render json: @disfraz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disfrazs/1
  # PATCH/PUT /disfrazs/1.json
  def update
    respond_to do |format|
      if @disfraz.update(disfraz_params)
        format.html { redirect_to @disfraz, notice: 'Disfraz was successfully updated.' }
        format.json { render :show, status: :ok, location: @disfraz }
      else
        format.html { render :edit }
        format.json { render json: @disfraz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disfrazs/1
  # DELETE /disfrazs/1.json
  def destroy
    @disfraz.destroy
    respond_to do |format|
      format.html { redirect_to disfrazs_url, notice: 'Disfraz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disfraz
      @disfraz = Disfraz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disfraz_params
      params[:disfraz]
    end
end
