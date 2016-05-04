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

ActiveRecord::Schema.define(version: 20160504215147) do

  create_table "cursos", force: :cascade do |t|
    t.string   "nome"
    t.text     "descricao"
    t.integer  "professor_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "cursos", ["professor_id"], name: "index_cursos_on_professor_id"

  create_table "inscricoes", force: :cascade do |t|
    t.string   "nome"
    t.string   "endereco"
    t.string   "telefone"
    t.string   "cidade"
    t.integer  "curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "inscricoes", ["curso_id"], name: "index_inscricoes_on_curso_id"

  create_table "notas", force: :cascade do |t|
    t.integer  "inscricao_id"
    t.integer  "curso_id"
    t.float    "nota"
    t.string   "frequencia"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "notas", ["curso_id"], name: "index_notas_on_curso_id"
  add_index "notas", ["inscricao_id"], name: "index_notas_on_inscricao_id"

  create_table "professores", force: :cascade do |t|
    t.string   "nome"
    t.string   "formacao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turmas", force: :cascade do |t|
    t.integer  "inscricao_id"
    t.integer  "curso_id"
    t.integer  "professor_id"
    t.string   "turma"
    t.string   "sala"
    t.string   "data_ini"
    t.string   "data_ter"
    t.string   "turno"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "turmas", ["curso_id"], name: "index_turmas_on_curso_id"
  add_index "turmas", ["inscricao_id"], name: "index_turmas_on_inscricao_id"
  add_index "turmas", ["professor_id"], name: "index_turmas_on_professor_id"

end
