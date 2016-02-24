class CategoriaController < ApplicationController
  before_action :set_categorium, only: [:show, :edit, :update, :destroy]
   before_filter :vendedor!, only: [:new, :edit, :update, :destroy,:index]
  before_filter :persona_normal!, only: [:show,:index]

  def vendedor!
    if current_vendedor
      redirect_to root_path, notice: 'No tienes suficientes permisos para estar acá.' unless current_vendedor.ES_ADMIN==true
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
    @disfrazs = Disfraz.where(ID_CATEGORIA: params[:id]).paginate(:page => params[:page], :per_page => 6)
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
      params.require(:categorium).permit(:NOMBRE_CATEGORIA, :ID_CATEGORIA)
    end
end



