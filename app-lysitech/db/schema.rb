# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_02_235527) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string "cnpj"
    t.string "inscr_estadual"
    t.string "razao_social"
    t.string "nome_fantasia"
    t.string "telefone"
    t.string "email"
    t.string "rua"
    t.string "numero"
    t.string "bairro"
    t.string "cep"
    t.string "cidade"
    t.string "uf"
    t.boolean "ativo"
    t.text "observacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ordem_servicos", force: :cascade do |t|
    t.string "titulo"
    t.string "categoria"
    t.text "descricao"
    t.text "solucao"
    t.integer "estatus"
    t.datetime "dt_abertura"
    t.datetime "dt_encerramento"
    t.bigint "perfil_id", null: false
    t.bigint "cliente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_ordem_servicos_on_cliente_id"
    t.index ["perfil_id"], name: "index_ordem_servicos_on_perfil_id"
  end

  create_table "perfils", force: :cascade do |t|
    t.string "nome"
    t.date "dt_nascimento"
    t.string "cpf"
    t.string "sexo"
    t.string "cargo"
    t.string "departamento"
    t.string "telefone"
    t.string "email"
    t.string "rua"
    t.string "numero"
    t.string "bairro"
    t.string "cep"
    t.string "cidade"
    t.string "uf"
    t.bigint "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_perfils_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "usuario"
    t.string "senha"
    t.boolean "ativo"
    t.boolean "gestor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ordem_servicos", "clientes"
  add_foreign_key "ordem_servicos", "perfils"
  add_foreign_key "perfils", "usuarios"
end
