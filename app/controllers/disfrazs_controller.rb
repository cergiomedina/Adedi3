class DisfrazsController < ApplicationController
  before_action :set_disfraz, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @categorias = Categoria.all
    
    if params[:search]
      @disfrazs = Disfraz.search(params[:search]).paginate(:page => params[:page], :per_page => 6)
      if @disfrazs.count == 0
         redirect_to disfrazs_path, notice: 'No se encontró ningún resultado.'
      else
        respond_with(@disfrazs)
      end
    else
      @disfrazs = Disfraz.paginate(:page => params[:page], :per_page => 6)
      respond_with(@disfrazs)
    end
    
  end

  def show
    respond_with(@disfraz)
  end

  def new
    @disfraz = Disfraz.new
    respond_with(@disfraz)
  end

  def edit
  end

  def create
    @disfraz = Disfraz.new(disfraz_params)
    @disfraz.save
    respond_with(@disfraz)
  end

  def update
    @disfraz.update(disfraz_params)
    respond_with(@disfraz)
  end

  def destroy
    @disfraz.destroy
    respond_with(@disfraz)
  end

  private
    def set_disfraz
      @disfraz = Disfraz.find(params[:id])
    end

    def disfraz_params
      params.require(:disfraz).permit(:ID_DISFRAZ, :ID_CATEGORIA, :CATEGORIA_DISFRAZ, :STOCK_DISFRAZ, :STOCK_DISPONIBLE,:imagen)
    end
end
