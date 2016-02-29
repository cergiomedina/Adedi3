class LogAuditoriaController < ApplicationController
  before_action :set_log_auditorium, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_vendedor!
  # GET /log_auditoria
  # GET /log_auditoria.json
  def index
    if current_vendedor
      if current_vendedor.ES_ADMIN == true
        @log_auditoria = LogAuditoria.paginate(:page => params[:page], :per_page => 15).order('ID_LOG DESC')
      else
        redirect_to root_path, notice: 'No tienes suficientes permisos para ingresar acá' and return
      end
    else
      redirect_to root_path, notice: 'No tienes suficientes permisos para ingresar acá' and return
    end
  end

  # GET /log_auditoria/1
  # GET /log_auditoria/1.json

  # GET /log_auditoria/new

  # GET /log_auditoria/1/edit

  # POST /log_auditoria
  # POST /log_auditoria.json


  # PATCH/PUT /log_auditoria/1
  # PATCH/PUT /log_auditoria/1.json


  # DELETE /log_auditoria/1
  # DELETE /log_auditoria/1.json



end
