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

ActiveRecord::Schema[7.0].define(version: 2023_01_27_114008) do
  create_table "friendships", force: :cascade do |t|
    t.integer "friender_id"
    t.integer "friendee_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friendee_id"], name: "index_friendships_on_friendee_id"
    t.index ["friender_id"], name: "index_friendships_on_friender_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "host_id"
    t.integer "no_players"
    t.string "turn"
    t.integer "round"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host_id"], name: "index_games_on_host_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.integer "response_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_messages_on_receiver_id"
    t.index ["response_id"], name: "index_messages_on_response_id"
    t.index ["sender_id"], name: "index_messages_on_sender_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.integer "game_id"
    t.integer "player_id"
    t.string "rank"
    t.boolean "first_move"
    t.integer "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_pieces_on_game_id"
    t.index ["player_id"], name: "index_pieces_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.string "status"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_players_on_game_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "friendships", "users", column: "friendee_id"
  add_foreign_key "friendships", "users", column: "friender_id"
  add_foreign_key "games", "users", column: "host_id"
  add_foreign_key "messages", "messages", column: "response_id"
  add_foreign_key "messages", "users", column: "receiver_id"
  add_foreign_key "messages", "users", column: "sender_id"
  add_foreign_key "pieces", "games"
  add_foreign_key "pieces", "players"
  add_foreign_key "players", "games"
  add_foreign_key "players", "users"
end
