# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_24_140515) do

  create_table "cards", force: :cascade do |t|
    t.string "associatedCards"
    t.string "associatedCardRefs"
    t.string "assets"
    t.string "region"
    t.string "regionRef"
    t.string "attack"
    t.string "cost"
    t.string "health"
    t.string "description"
    t.string "descriptionRaw"
    t.string "levelupDescription"
    t.string "levelupDescriptionRaw"
    t.string "flavorText"
    t.string "artistName"
    t.string "name"
    t.string "cardCode"
    t.string "keywords"
    t.string "keywordRefs"
    t.string "spellSpeed"
    t.string "spellSpeedRef"
    t.string "rarity"
    t.string "rarityRef"
    t.string "subtype"
    t.string "subtypes"
    t.string "supertype"
    t.string "type"
    t.string "collectible"
    t.string "gameAbsolutePath"
    t.string "fullAbsolutePath"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
