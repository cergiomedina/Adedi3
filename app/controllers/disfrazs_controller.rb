class DisfrazsController < ApplicationController
  before_action :set_disfraz, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
      @categorias = Categoria.all.order('NOMBRE_CATEGORIA')
      @disfrazs = Disfraz.paginate(:page => params[:page], :per_page => 6)
      if params[:search]
        @disfrazs = Disfraz.search(params[:search]).paginate(:page => params[:page], :per_page => 6)
        if @disfrazs.count == 0
           redirect_to disfrazs_path, notice: 'No se encontró ningún resultado.'and return
        else
          respond_with(@disfrazs)
        end
      elsif params[:ID_CATEGORIA]
        @disfrazs = Disfraz.where(ID_CATEGORIA: params[:ID_CATEGORIA]).paginate(:page => params[:page], :per_page => 6)
        if @disfrazs.count == 0
           redirect_to disfrazs_path, notice: 'No se encontró ningún resultado.'and return
        else
          @categoria = Categoria.where(ID_CATEGORIA: params[:ID_CATEGORIA]).take
          respond_with(@disfrazs)
        end
      else
        respond_with(@disfrazs)
      end
  end

  def show
    if current_cliente
      @cliente = Cliente.find(current_cliente)
    end
    respond_with(@disfraz)
    
  end

  def new
    if current_vendedor
      if current_vendedor.ES_ADMIN == true
        @categorias = Categoria.all.order('NOMBRE_CATEGORIA')
        @categorium = Categoria.new
        @disfraz = Disfraz.new
        respond_with(@disfraz)
      else
        redirect_to '/disfrazs', notice: 'No tienes permiso para entrar a esta ubicación.' and return
      end
    else  
      redirect_to '/disfrazs', notice: 'No tienes permiso para entrar a esta ubicación.' and return
    end 
  end

  def edit
  end

  def create
    @categorias = Categoria.all.order('NOMBRE_CATEGORIA')
    @categorium = Categoria.new
    @disfraz = Disfraz.new(disfraz_params)
    @disfraz.STOCK_DISPONIBLE = 0
    @disfraz.STOCK_DISFRAZ = 0
    @disfraz.save
    respond_with(@disfraz)
  end

  def update
    @disfraz.update(disfraz_params)
    respond_with(@disfraz)
  end

  def destroy
    @ejemplares = Ejemplar.where(ID_DISFRAZ: @disfraz.id)
    if @ejemplares.count == 0
      @disfraz.destroy
      respond_with(@disfraz)
    else
      redirect_to '/disfrazs', notice: 'El disfraz no puede ser eliminado, ya que posee ejemplares asociados'
    end
  end

  private
    def set_disfraz

      @disfraz = Disfraz.find(params[:id])
    end

    def disfraz_params
      params.require(:disfraz).permit(:ID_DISFRAZ,:precio,:descripcion, :ID_CATEGORIA, :NOMBRE_DISFRAZ, :CATEGORIA_DISFRAZ, :STOCK_DISFRAZ, :STOCK_DISPONIBLE,:imagen)
    end
end
