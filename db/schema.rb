# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160217001539) do

  create_table "arriendo", primary_key: "ID_ARRIENDO", force: true do |t|
    t.integer "ID_VENDEDOR",                 null: false
    t.integer "ID_EST_ARRIENDO",             null: false
    t.integer "ID_PEDIDO"
    t.integer "ID_CLIENTE",                  null: false
    t.integer "NUMERO_DISFRACES",            null: false
    t.date    "FECHA_ARRIENDO",              null: false
    t.string  "ESTADO_ARRIENDO",  limit: 20
    t.float   "TOTAL_ARRIENDO",   limit: 24, null: false
    t.float   "TOTAL_GARANTIA",   limit: 24, null: false
  end

  add_index "arriendo", ["ID_CLIENTE"], name: "FK_RELATIONSHIP_10", using: :btree
  add_index "arriendo", ["ID_EST_ARRIENDO"], name: "FK_RELATIONSHIP_9", using: :btree
  add_index "arriendo", ["ID_PEDIDO"], name: "FK_RELATIONSHIP_11", using: :btree
  add_index "arriendo", ["ID_VENDEDOR"], name: "FK_RELATIONSHIP_13", using: :btree

  create_table "arriendo_estado", primary_key: "ID_EST_ARRIENDO", force: true do |t|
    t.string "EST_ARRIENDO", limit: 20
  end

  create_table "categoria", primary_key: "ID_CATEGORIA", force: true do |t|
    t.string  "NOMBRE_CATEGORIA", limit: 20
    t.integer "STOCK_CATEGORIA",             default: 0, null: false
  end

  create_table "cliente", primary_key: "ID_CLIENTE", force: true do |t|
    t.integer  "ID_EST_CLIENTE",                    default: 1,  null: false
    t.string   "NOMBRE_CLIENTE",         limit: 20
    t.string   "APELLIDO_CLIENTE",       limit: 20
    t.integer  "RUT_CLIENTE"
    t.string   "DIRECCION_CLIENTE",      limit: 50
    t.integer  "TELEFONO_CLIENTE"
    t.string   "ESTADO_CLIENTE",         limit: 20
    t.string   "email",                             default: "", null: false
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "cliente", ["ID_EST_CLIENTE"], name: "FK_RELATIONSHIP_5", using: :btree
  add_index "cliente", ["email"], name: "index_cliente_on_email", unique: true, using: :btree
  add_index "cliente", ["reset_password_token"], name: "index_cliente_on_reset_password_token", unique: true, using: :btree

  create_table "cliente_estado", primary_key: "ID_EST_CLIENTE", force: true do |t|
    t.string "EST_CLIENTE", limit: 20
  end

  create_table "detalle_arriendo", id: false, force: true do |t|
    t.integer "ID_ARRIENDO",                       null: false
    t.integer "LINEA_DETALLE_ARRIENDO",            null: false
    t.integer "ID_EJEMPLAR",                       null: false
    t.float   "GARANTIA_ARRIENDO",      limit: 24
    t.float   "PRECIO_ARRIENDO",        limit: 24
    t.float   "DIFERENCIA_DINERO",      limit: 24
  end

  add_index "detalle_arriendo", ["ID_EJEMPLAR"], name: "FK_RELATIONSHIP_15", using: :btree

  create_table "detalle_devolucion", id: false, force: true do |t|
    t.integer "ID_DEVOLUCION",     null: false
    t.integer "LINEA_DETALLE_DEV", null: false
    t.integer "ID_NOTA",           null: false
    t.integer "ID_MULTA"
    t.integer "ID_EJEMPLAR",       null: false
  end

  add_index "detalle_devolucion", ["ID_EJEMPLAR"], name: "FK_RELATIONSHIP_16", using: :btree
  add_index "detalle_devolucion", ["ID_MULTA"], name: "FK_RELATIONSHIP_17", using: :btree
  add_index "detalle_devolucion", ["ID_NOTA"], name: "FK_RELATIONSHIP_18", using: :btree

  create_table "devolucion", primary_key: "ID_DEVOLUCION", force: true do |t|
    t.integer "ID_NOTA",          null: false
    t.integer "ID_VENDEDOR",      null: false
    t.integer "ID_ARRIENDO",      null: false
    t.date    "FECHA_DEVOLUCION"
  end

  add_index "devolucion", ["ID_ARRIENDO"], name: "FK_RELATIONSHIP_24", using: :btree
  add_index "devolucion", ["ID_NOTA"], name: "FK_RELATIONSHIP_20", using: :btree
  add_index "devolucion", ["ID_VENDEDOR"], name: "FK_RELATIONSHIP_23", using: :btree

  create_table "disfraz", primary_key: "ID_DISFRAZ", force: true do |t|
    t.integer  "ID_CATEGORIA",                   null: false
    t.string   "NOMBRE_DISFRAZ",      limit: 20, null: false
    t.string   "CATEGORIA_DISFRAZ",   limit: 20
    t.integer  "STOCK_DISFRAZ",                  null: false
    t.integer  "STOCK_DISPONIBLE",               null: false
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
  end

  add_index "disfraz", ["ID_CATEGORIA"], name: "FK_RELATIONSHIP_3", using: :btree

  create_table "ejemplar", primary_key: "ID_EJEMPLAR", force: true do |t|
    t.integer "ID_DISFRAZ",                 null: false
    t.string  "TALLA_EJEMPLAR",  limit: 20
    t.string  "COLOR_EJEMPLAR",  limit: 20
    t.string  "ESTADO_EJEMPLAR", limit: 20
    t.string  "PRECIO_EJEMPLAR", limit: 20
  end

  add_index "ejemplar", ["ID_DISFRAZ"], name: "FK_RELATIONSHIP_2", using: :btree

  create_table "ejemplar_estado", primary_key: "ID_ESTADO_CLIENTE", force: true do |t|
    t.string "EST_EJEMPLAR", limit: 20
  end

  create_table "log_auditoria", primary_key: "ID_LOG", force: true do |t|
    t.integer "RUT_USUARIO"
    t.string  "TABLA_AFECTADA",     limit: 20
    t.string  "INSTRUCCION",        limit: 20
    t.string  "DATOS_ANTES",        limit: 20
    t.string  "DATOS_DESPUES",      limit: 20
    t.string  "FECHA_MODIFICACION", limit: 20
  end

  create_table "multa", primary_key: "ID_MULTA", force: true do |t|
    t.integer "ID_DEVOLUCION",            null: false
    t.float   "TOTAL_MULTA",   limit: 24
  end

  add_index "multa", ["ID_DEVOLUCION"], name: "FK_RELATIONSHIP_22", using: :btree

  create_table "nota_de_venta", primary_key: "ID_NOTA", force: true do |t|
    t.integer "ID_DEVOLUCION",            null: false
    t.float   "TOTAL_NOTA",    limit: 24
  end

  add_index "nota_de_venta", ["ID_DEVOLUCION"], name: "FK_RELATIONSHIP_21", using: :btree

  create_table "parametro_sistema", primary_key: "ID_PARAMETRO", force: true do |t|
    t.string  "NOMBRE_PARAMETRO",      limit: 20
    t.integer "VALOR_PARAMETRO"
    t.string  "TIPO_PARAMETRO",        limit: 11
    t.text    "DESCRIPCION_PARAMETRO"
  end

  create_table "pedido", primary_key: "ID_PEDIDO", force: true do |t|
    t.integer "ID_CLIENTE",               null: false
    t.integer "ID_EST_PEDIDO",            null: false
    t.date    "FECHA_PEDIDO"
    t.string  "ESTADO_PEDIDO", limit: 20
  end

  add_index "pedido", ["ID_CLIENTE"], name: "FK_RELATIONSHIP_6", using: :btree
  add_index "pedido", ["ID_EST_PEDIDO"], name: "FK_RELATIONSHIP_8", using: :btree

  create_table "pedido_estado", primary_key: "ID_EST_PEDIDO", force: true do |t|
    t.string "EST_PEDIDO", limit: 20
  end

  create_table "pedidos_detalle", id: false, force: true do |t|
    t.integer "ID_DISFRAZ",   null: false
    t.integer "ID_PEDIDO",    null: false
    t.date    "FECHA_RETIRO"
    t.date    "FECHA_DEV"
  end

  add_index "pedidos_detalle", ["ID_PEDIDO"], name: "FK_RELATIONSHIP_7", using: :btree

  create_table "transicion_arriendo", id: false, force: true do |t|
    t.integer "ARR_ID_EST_ARRIENDO",            null: false
    t.integer "ID_EST_ARRIENDO",                null: false
    t.string  "EST_INI_ARRIENDO",    limit: 20
    t.string  "EST_FIN_ARRIENDO",    limit: 20
  end

  add_index "transicion_arriendo", ["ID_EST_ARRIENDO"], name: "FK_RELATIONSHIP_26", using: :btree

  create_table "transicion_est_cliente", id: false, force: true do |t|
    t.integer "ID_EST_CLIENTE",                null: false
    t.integer "CLI_ID_EST_CLIENTE",            null: false
    t.string  "EST_INI_CLIENTE",    limit: 20
    t.string  "EST_FIN_CLIENTE",    limit: 20
  end

  add_index "transicion_est_cliente", ["CLI_ID_EST_CLIENTE"], name: "FK_RELATIONSHIP_28", using: :btree

  create_table "transicion_est_ejemplar", id: false, force: true do |t|
    t.integer "EJE_ID_ESTADO_CLIENTE",            null: false
    t.integer "ID_ESTADO_CLIENTE",                null: false
    t.string  "EST_INI_EJEMPLAR",      limit: 20
    t.string  "EST_FIN_EJEMPLAR",      limit: 20
  end

  add_index "transicion_est_ejemplar", ["ID_ESTADO_CLIENTE"], name: "FK_RELATIONSHIP_30", using: :btree

  create_table "transicion_est_pedido", id: false, force: true do |t|
    t.integer "ID_EST_PEDIDO",                null: false
    t.integer "PED_ID_EST_PEDIDO",            null: false
    t.string  "EST_INI_PEDIDO",    limit: 20
    t.string  "EST_FIN_PEDIDO",    limit: 20
  end

  add_index "transicion_est_pedido", ["PED_ID_EST_PEDIDO"], name: "FK_RELATIONSHIP_34", using: :btree

  create_table "transicion_est_vendedor", id: false, force: true do |t|
    t.integer "ID_EST_VENDEDOR",                null: false
    t.integer "VEN_ID_EST_VENDEDOR",            null: false
    t.string  "EST_INI_VENDEDOR",    limit: 20
    t.string  "EST_FIN_VENDEDOR",    limit: 20
  end

  add_index "transicion_est_vendedor", ["VEN_ID_EST_VENDEDOR"], name: "FK_RELATIONSHIP_32", using: :btree

  create_table "vendedor", primary_key: "ID_VENDEDOR", force: true do |t|
    t.integer  "ID_EST_VENDEDOR",                   default: 1,            null: false
    t.string   "NOMBRE_VENDEDOR",        limit: 20,                        null: false
    t.string   "APELLIDO_VENDEDOR",      limit: 20
    t.integer  "RUT_VENDEDOR",                                             null: false
    t.string   "DIRECCION_VENDEDOR",     limit: 50,                        null: false
    t.integer  "TELEFONO_VENDEDOR",                                        null: false
    t.string   "ESTADO_VENDEDOR",        limit: 20, default: "HABILITADO", null: false
    t.boolean  "ES_ADMIN",                          default: false,        null: false
    t.string   "email",                             default: "",           null: false
    t.string   "encrypted_password",                default: "",           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "vendedor", ["ID_EST_VENDEDOR"], name: "FK_RELATIONSHIP_14", using: :btree
  add_index "vendedor", ["email"], name: "index_vendedor_on_email", unique: true, using: :btree
  add_index "vendedor", ["reset_password_token"], name: "index_vendedor_on_reset_password_token", unique: true, using: :btree

  create_table "vendedor_estado", primary_key: "ID_EST_VENDEDOR", force: true do |t|
    t.string "EST_VENDEDOR", limit: 20
  end

end
