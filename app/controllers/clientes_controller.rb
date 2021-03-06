class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]
  before_filter :cliente!, only: [:edit, :update, :destroy], except: [:index]
  before_filter :vendedor!, only: [:new, :edit, :update, :destroy,:index]

  def cliente!
    #redirect_to root_path, notice: 'No tienes suficientes permisos para estar acá.' unless current_cliente 
  end

  def vendedor!
    #redirect_to root_path, notice: 'No tienes suficientes permisos para estar acá.' unless current_vendedor
  end

  # GET /clientes
  # GET /clientes.json
  def index
    @clientes = Cliente.paginate(:page => params[:page], :per_page => 10).order('NOMBRE_CLIENTE')
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
    
    @cliente = Cliente.find(params[:id])
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: 'Cliente was successfully created.' }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: 'Cliente was successfully updated.' }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @cliente.destroy
    respond_to do |format|
      format.html { redirect_to clientes_url, notice: 'Cliente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      if current_vendedor
        @cliente = Cliente.find(params[:id])


      else
      @cliente = Cliente.find(current_cliente)
     end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:cliente).permit(:NOMBRE_CLIENTE,:APELLIDO_CLIENTE,:RUT_CLIENTE,:DIRECCION_CLIENTE,:TELEFONO_CLIENTE)
    end

 

end
