class ArriendosController < ApplicationController
  before_action :set_arriendo, only: [:show, :edit, :update, :destroy]

  # GET /arriendos
  # GET /arriendos.json
  def index
    @arriendos = Arriendo.all.paginate(:page => params[:page], :per_page => 10).order('ESTADO_ARRIENDO ASC')

  end

  # GET /arriendos/1
  # GET /arriendos/1.json
  def show
    if Pedido.exists?(@arriendo.ID_PEDIDO)
      @pedido = Pedido.find(@arriendo.ID_PEDIDO)
      @disfrazs = @pedido.pedidos_detalles
    else
      redirect_to '/arriendos', notice:'No se puede acceder al arriendo seleccionado.'
    end
  end

  # GET /arriendos/new
  def new
    @arriendo = Arriendo.new
  end

  # GET /arriendos/1/edit
  def edit
  end

  def devolucion

    if current_vendedor
      @arriendo = Arriendo.find(params[:id])
      ActiveRecord::Base.transaction do

        @arriendo.ESTADO_ARRIENDO = "DEVUELTO"

        @devolucion = @arriendo.devolucion.new( ID_VENDEDOR: current_vendedor.id , FECHA_DEVOLUCION: Time.now)
        r1 = @devolucion

        r3 = @arriendo.save!
        if r3 and r1
          redirect_to '/arriendos', notice: 'El arriendo ha sido devuelto correctamente. Se ha añadido a devoluciones.'
        else  
          raise ActiveRecord::Rollback
        end
     
      end 
    end 

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
