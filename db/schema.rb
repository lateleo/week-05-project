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

ActiveRecord::Schema.define(version: 12) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string  "name"
    t.string  "damage_type"
    t.integer "base_damage"
    t.string  "interval"
    t.integer "range"
    t.string  "effect_shape"
    t.integer "effect_size"
    t.text    "description"
  end

  create_table "abilities_base_classes", id: false, force: :cascade do |t|
    t.integer "ability_id",    null: false
    t.integer "base_class_id", null: false
  end

  create_table "abilities_characters", id: false, force: :cascade do |t|
    t.integer "ability_id",   null: false
    t.integer "character_id", null: false
  end

  create_table "abilities_prestige_classes", id: false, force: :cascade do |t|
    t.integer "ability_id",        null: false
    t.integer "prestige_class_id", null: false
  end

  create_table "base_classes", force: :cascade do |t|
    t.string "name"
    t.string "range"
    t.string "role"
    t.string "armor_type"
    t.string "primary_stat"
    t.string "seconardy_stat"
    t.text   "flavor_text"
  end

  create_table "characters", force: :cascade do |t|
    t.string  "name"
    t.integer "age"
    t.integer "level"
    t.integer "race_id"
    t.integer "racial_ability_id"
    t.integer "class_id"
    t.integer "stamina"
    t.integer "strength"
    t.integer "agility"
    t.integer "spell_power"
    t.integer "wit"
    t.text    "backstory"
  end

  create_table "characters_prestige_classes", id: false, force: :cascade do |t|
    t.integer "character_id",      null: false
    t.integer "prestige_class_id", null: false
  end

  create_table "prestige_classes", force: :cascade do |t|
    t.string "name"
    t.string "range"
    t.string "role"
    t.string "armor_type"
    t.string "primary_stat"
    t.string "seconardy_stat"
    t.text   "entry_requirements"
    t.text   "flavor_text"
  end

  create_table "races", force: :cascade do |t|
    t.string  "name"
    t.integer "age_of_adulthood"
    t.integer "stamina_index"
    t.integer "strength_index"
    t.integer "agility_index"
    t.integer "spell_power_index"
    t.integer "wit_index"
    t.text    "flavor_text"
  end

  create_table "racial_abilities", force: :cascade do |t|
    t.string  "name"
    t.integer "race_id"
    t.text    "in_game_effect"
    t.string  "cooldown"
    t.text    "flavor_text"
    t.string  "ability_id"
  end

end
