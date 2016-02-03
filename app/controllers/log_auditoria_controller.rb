class LogAuditoriaController < ApplicationController
  before_action :set_log_auditorium, only: [:show, :edit, :update, :destroy]

  # GET /log_auditoria
  # GET /log_auditoria.json
  def index
    @log_auditoria = LogAuditorium.all
  end

  # GET /log_auditoria/1
  # GET /log_auditoria/1.json
  def show
  end

  # GET /log_auditoria/new
  def new
    @log_auditorium = LogAuditorium.new
  end

  # GET /log_auditoria/1/edit
  def edit
  end

  # POST /log_auditoria
  # POST /log_auditoria.json
  def create
    @log_auditorium = LogAuditorium.new(log_auditorium_params)

    respond_to do |format|
      if @log_auditorium.save
        format.html { redirect_to @log_auditorium, notice: 'Log auditorium was successfully created.' }
        format.json { render :show, status: :created, location: @log_auditorium }
      else
        format.html { render :new }
        format.json { render json: @log_auditorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /log_auditoria/1
  # PATCH/PUT /log_auditoria/1.json
  def update
    respond_to do |format|
      if @log_auditorium.update(log_auditorium_params)
        format.html { redirect_to @log_auditorium, notice: 'Log auditorium was successfully updated.' }
        format.json { render :show, status: :ok, location: @log_auditorium }
      else
        format.html { render :edit }
        format.json { render json: @log_auditorium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /log_auditoria/1
  # DELETE /log_auditoria/1.json
  def destroy
    @log_auditorium.destroy
    respond_to do |format|
      format.html { redirect_to log_auditoria_url, notice: 'Log auditorium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log_auditorium
      @log_auditorium = LogAuditorium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_auditorium_params
      params[:log_auditorium]
    end
end
