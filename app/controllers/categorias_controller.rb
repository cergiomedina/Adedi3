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


  respond_to :html

  def index
    @categoria = Categorium.all
    respond_with(@categoria)
  end

  def show
    respond_with(@categorium)
  end

  def new
    @categorium = Categorium.new
    respond_with(@categorium)
  end

  def edit
  end

  def create
    @categorium = Categorium.new(categorium_params)
    @categorium.save
    respond_with(@categorium)
  end

  def update
    @categorium.update(categorium_params)
    respond_with(@categorium)
  end

  def destroy
    @categorium.destroy
    respond_with(@categorium)
  end

  private
    def set_categorium
      @categorium = Categorium.find(params[:id])
    end

    def categorium_params
      params.require(:categoria).permit(:NOMBRE_CATEGORIA, :STOCK_CATEGORIA, :ID_CATEGORIA)
    end
end
