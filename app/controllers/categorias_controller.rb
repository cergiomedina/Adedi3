class CategoriasController < ApplicationController
  before_action :set_categorium, only: [:show, :edit, :update, :destroy]
  before_filter :vendedor!, only: [:new, :edit, :update, :destroy,:index]
  before_filter :persona_normal!, only: [:show,:index]

  def vendedor!
    if current_vendedor
      redirect_to root_path, notice: 'No tienes suficientes permisos para estar acá.' unless current_vendedor.ES_ADMIN==1
    end
  end

  def persona_normal!
    redirect_to root_path, notice: 'No tienes suficientes permisos para estar acá.' unless current_cliente || current_vendedor
  end

  # GET /categoria
  # GET /categoria.json
  def index
    @categoria = Categoria.all
  end

  # GET /categoria/1
  # GET /categoria/1.json
  def show
  end

  # GET /categoria/new
  def new
    @categorium = Categoria.new
  end

  # GET /categoria/1/edit
  def edit
  end

  # POST /categoria
  # POST /categoria.json
  def create
    @categorium = Categoria.new(categorium_params)

    respond_to do |format|
      if @categorium.save
        format.html { redirect_to @categorium, notice: 'Categorium was successfully created.' }
        format.json { render :show, status: :created, location: @categorium }
      else
        format.html { render :new }
        format.json { render json: @categorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categoria/1
  # PATCH/PUT /categoria/1.json
  def update
    respond_to do |format|
      if @categorium.update(categorium_params)
        format.html { redirect_to @categorium, notice: 'Categorium was successfully updated.' }
        format.json { render :show, status: :ok, location: @categorium }
      else
        format.html { render :edit }
        format.json { render json: @categorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoria/1
  # DELETE /categoria/1.json
  def destroy
    @categorium.destroy
    respond_to do |format|
      format.html { redirect_to categoria_url, notice: 'Categorium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categorium
      @categorium = Categoria.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categorium_params
      params[:categorium]
    end
end
