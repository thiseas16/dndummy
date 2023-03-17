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

ActiveRecord::Schema[7.0].define(version: 2023_03_16_212053) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ability_bonuses", force: :cascade do |t|
    t.integer "bonus"
    t.string "ability_name"
    t.bigint "race_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_ability_bonuses_on_race_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "attacks", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.string "weapon"
    t.integer "attack_modifier"
    t.string "dmg"
    t.string "dmg_type"
    t.integer "range"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_attacks_on_character_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.text "description"
    t.string "title"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "character_class_list_joins", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "class_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_class_list_joins_on_character_id"
    t.index ["class_list_id"], name: "index_character_class_list_joins_on_class_list_id"
  end

  create_table "character_feat_joins", force: :cascade do |t|
    t.bigint "feat_id", null: false
    t.bigint "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_feat_joins_on_character_id"
    t.index ["feat_id"], name: "index_character_feat_joins_on_feat_id"
  end

  create_table "character_item_joins", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_item_joins_on_character_id"
    t.index ["item_id"], name: "index_character_item_joins_on_item_id"
  end

  create_table "character_language_joins", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_language_joins_on_character_id"
    t.index ["language_id"], name: "index_character_language_joins_on_language_id"
  end

  create_table "character_proficiency_joins", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "proficiency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_proficiency_joins_on_character_id"
    t.index ["proficiency_id"], name: "index_character_proficiency_joins_on_proficiency_id"
  end

  create_table "character_spell_joins", force: :cascade do |t|
    t.bigint "spell_id", null: false
    t.bigint "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_spell_joins_on_character_id"
    t.index ["spell_id"], name: "index_character_spell_joins_on_spell_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.string "alignment"
    t.integer "exp"
    t.integer "total_hp"
    t.integer "current_hp"
    t.integer "temp_hp"
    t.text "personality_traits"
    t.text "ideals"
    t.text "bonds"
    t.text "flaws"
    t.integer "speed"
    t.integer "armor_class"
    t.integer "inititiave"
    t.text "backstory"
    t.text "appearance"
    t.integer "age"
    t.integer "height"
    t.integer "weight"
    t.string "eyes"
    t.string "skin"
    t.string "hair"
    t.integer "dex"
    t.integer "str"
    t.integer "const"
    t.integer "cha"
    t.integer "int"
    t.integer "wis"
    t.bigint "campaign_id", null: false
    t.bigint "encounter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "race"
    t.string "class_list"
    t.index ["campaign_id"], name: "index_characters_on_campaign_id"
    t.index ["encounter_id"], name: "index_characters_on_encounter_id"
  end

  create_table "class_list_item_granted_joins", force: :cascade do |t|
    t.bigint "class_list_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_list_id"], name: "index_class_list_item_granted_joins_on_class_list_id"
    t.index ["item_id"], name: "index_class_list_item_granted_joins_on_item_id"
  end

  create_table "class_list_proficiency_granted_joins", force: :cascade do |t|
    t.bigint "class_list_id", null: false
    t.bigint "proficiency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_list_id"], name: "index_class_list_proficiency_granted_joins_on_class_list_id"
    t.index ["proficiency_id"], name: "index_class_list_proficiency_granted_joins_on_proficiency_id"
  end

  create_table "class_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hit_die"
    t.integer "proficiency_ammount"
    t.text "h1"
    t.text "h2"
    t.text "h3"
    t.text "h4"
    t.string "h1_title"
    t.string "h2_title"
    t.string "h3_title"
    t.string "h4_title"
    t.text "description"
  end

  create_table "dice_rolls", force: :cascade do |t|
    t.integer "ammount_of_dice"
    t.integer "type_of_dice"
    t.integer "total"
    t.bigint "campaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_dice_rolls_on_campaign_id"
  end

  create_table "encounters", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "tactics"
    t.bigint "campaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_encounters_on_campaign_id"
  end

  create_table "feat_class_list_joins", force: :cascade do |t|
    t.bigint "feat_id", null: false
    t.bigint "class_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_list_id"], name: "index_feat_class_list_joins_on_class_list_id"
    t.index ["feat_id"], name: "index_feat_class_list_joins_on_feat_id"
  end

  create_table "feats", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "lvl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_feat_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "prompt"
    t.bigint "campaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_images_on_campaign_id"
  end

  create_table "item_choice_joins", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "item_choice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_choice_id"], name: "index_item_choice_joins_on_item_choice_id"
    t.index ["item_id"], name: "index_item_choice_joins_on_item_id"
  end

  create_table "item_choices", force: :cascade do |t|
    t.integer "no_of_choices"
    t.bigint "class_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_list_id"], name: "index_item_choices_on_class_list_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "level_feat_joins", force: :cascade do |t|
    t.bigint "level_id", null: false
    t.bigint "feat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feat_id"], name: "index_level_feat_joins_on_feat_id"
    t.index ["level_id"], name: "index_level_feat_joins_on_level_id"
  end

  create_table "levels", force: :cascade do |t|
    t.integer "lvl"
    t.integer "ability_score_bonuses"
    t.integer "prof_bonus"
    t.integer "cantrips_known"
    t.integer "spells_known"
    t.integer "spell_slots_lvl_1"
    t.integer "spell_slots_lvl_2"
    t.integer "spell_slots_lvl_3"
    t.integer "spell_slots_lvl_4"
    t.integer "spell_slots_lvl_5"
    t.integer "spell_slots_lvl_6"
    t.integer "spell_slots_lvl_7"
    t.integer "spell_slots_lvl_8"
    t.integer "spell_slots_lvl_9"
    t.boolean "spellcasting"
    t.text "class_specific"
    t.bigint "class_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_list_id"], name: "index_levels_on_class_list_id"
  end

  create_table "prerequisites", force: :cascade do |t|
    t.string "name"
    t.bigint "feat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feat_id"], name: "index_prerequisites_on_feat_id"
  end

  create_table "proficiencies", force: :cascade do |t|
    t.string "name"
    t.string "prof_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proficiency_choice_joins", force: :cascade do |t|
    t.bigint "proficiency_choice_id", null: false
    t.bigint "proficiency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proficiency_choice_id"], name: "index_proficiency_choice_joins_on_proficiency_choice_id"
    t.index ["proficiency_id"], name: "index_proficiency_choice_joins_on_proficiency_id"
  end

  create_table "proficiency_choices", force: :cascade do |t|
    t.integer "no_of_choices"
    t.bigint "class_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_list_id"], name: "index_proficiency_choices_on_class_list_id"
  end

  create_table "race_language_joins", force: :cascade do |t|
    t.bigint "race_id", null: false
    t.bigint "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_race_language_joins_on_language_id"
    t.index ["race_id"], name: "index_race_language_joins_on_race_id"
  end

  create_table "race_proficiency_choice_joins", force: :cascade do |t|
    t.bigint "race_id", null: false
    t.bigint "proficiency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proficiency_id"], name: "index_race_proficiency_choice_joins_on_proficiency_id"
    t.index ["race_id"], name: "index_race_proficiency_choice_joins_on_race_id"
  end

  create_table "race_proficiency_granted_joins", force: :cascade do |t|
    t.bigint "race_id", null: false
    t.bigint "proficiency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proficiency_id"], name: "index_race_proficiency_granted_joins_on_proficiency_id"
    t.index ["race_id"], name: "index_race_proficiency_granted_joins_on_race_id"
  end

  create_table "race_trait_joins", force: :cascade do |t|
    t.bigint "race_id", null: false
    t.bigint "trait_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["race_id"], name: "index_race_trait_joins_on_race_id"
    t.index ["trait_id"], name: "index_race_trait_joins_on_trait_id"
  end

  create_table "races", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "speed"
    t.integer "age"
    t.string "alignment"
    t.string "size"
    t.string "size_description"
    t.text "language_description"
    t.integer "proficiency_choice_number"
  end

  create_table "saving_throws", force: :cascade do |t|
    t.string "name"
    t.bigint "class_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_list_id"], name: "index_saving_throws_on_class_list_id"
  end

  create_table "skills", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.string "name"
    t.boolean "proficiency"
    t.string "stat_modifier"
    t.integer "bonus"
    t.integer "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_skills_on_character_id"
  end

  create_table "spell_class_list_joins", force: :cascade do |t|
    t.bigint "class_list_id", null: false
    t.bigint "spell_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_list_id"], name: "index_spell_class_list_joins_on_class_list_id"
    t.index ["spell_id"], name: "index_spell_class_list_joins_on_spell_id"
  end

  create_table "spells", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "higher_lvl"
    t.string "range"
    t.integer "lvl"
    t.string "attack_type"
    t.string "dmg_type"
    t.string "dmg_at_lvl_1"
    t.string "dmg_at_lvl_2"
    t.string "dmg_at_lvl_3"
    t.string "dmg_at_lvl_4"
    t.string "dmg_at_lvl_5"
    t.string "dmg_at_lvl_6"
    t.string "dmg_at_lvl_7"
    t.string "dmg_at_lvl_8"
    t.string "dmg_at_lvl_9"
    t.string "school"
    t.boolean "somatic_component"
    t.boolean "verbal_component"
    t.boolean "material_component"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "duration"
    t.string "casting_time"
    t.boolean "concentration"
    t.boolean "ritual"
    t.string "dmg_at_character_lvl_1"
    t.string "dmg_at_character_lvl_5"
    t.string "dmg_at_character_lvl_11"
    t.string "dmg_at_character_lvl_17"
    t.string "material"
    t.string "area_of_effect"
  end

  create_table "trait_proficiency_choice_joins", force: :cascade do |t|
    t.bigint "trait_id", null: false
    t.bigint "proficiency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proficiency_id"], name: "index_trait_proficiency_choice_joins_on_proficiency_id"
    t.index ["trait_id"], name: "index_trait_proficiency_choice_joins_on_trait_id"
  end

  create_table "trait_proficiency_granted_joins", force: :cascade do |t|
    t.bigint "trait_id", null: false
    t.bigint "proficiency_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proficiency_id"], name: "index_trait_proficiency_granted_joins_on_proficiency_id"
    t.index ["trait_id"], name: "index_trait_proficiency_granted_joins_on_trait_id"
  end

  create_table "traits", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "proficiency_choice_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ability_bonuses", "races"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attacks", "characters"
  add_foreign_key "campaigns", "users"
  add_foreign_key "character_class_list_joins", "characters"
  add_foreign_key "character_class_list_joins", "class_lists"
  add_foreign_key "character_feat_joins", "characters"
  add_foreign_key "character_feat_joins", "feats"
  add_foreign_key "character_item_joins", "characters"
  add_foreign_key "character_item_joins", "items"
  add_foreign_key "character_language_joins", "characters"
  add_foreign_key "character_language_joins", "languages"
  add_foreign_key "character_proficiency_joins", "characters"
  add_foreign_key "character_proficiency_joins", "proficiencies"
  add_foreign_key "character_spell_joins", "characters"
  add_foreign_key "character_spell_joins", "spells"
  add_foreign_key "characters", "campaigns"
  add_foreign_key "characters", "encounters"
  add_foreign_key "class_list_item_granted_joins", "class_lists"
  add_foreign_key "class_list_item_granted_joins", "items"
  add_foreign_key "class_list_proficiency_granted_joins", "class_lists"
  add_foreign_key "class_list_proficiency_granted_joins", "proficiencies"
  add_foreign_key "dice_rolls", "campaigns"
  add_foreign_key "encounters", "campaigns"
  add_foreign_key "feat_class_list_joins", "class_lists"
  add_foreign_key "feat_class_list_joins", "feats"
  add_foreign_key "feats", "feats", column: "parent_feat_id"
  add_foreign_key "images", "campaigns"
  add_foreign_key "item_choice_joins", "item_choices"
  add_foreign_key "item_choice_joins", "items"
  add_foreign_key "item_choices", "class_lists"
  add_foreign_key "level_feat_joins", "feats"
  add_foreign_key "level_feat_joins", "levels"
  add_foreign_key "levels", "class_lists"
  add_foreign_key "prerequisites", "feats"
  add_foreign_key "proficiency_choice_joins", "proficiencies"
  add_foreign_key "proficiency_choice_joins", "proficiency_choices"
  add_foreign_key "proficiency_choices", "class_lists"
  add_foreign_key "race_language_joins", "languages"
  add_foreign_key "race_language_joins", "races"
  add_foreign_key "race_proficiency_choice_joins", "proficiencies"
  add_foreign_key "race_proficiency_choice_joins", "races"
  add_foreign_key "race_proficiency_granted_joins", "proficiencies"
  add_foreign_key "race_proficiency_granted_joins", "races"
  add_foreign_key "race_trait_joins", "races"
  add_foreign_key "race_trait_joins", "traits"
  add_foreign_key "saving_throws", "class_lists"
  add_foreign_key "skills", "characters"
  add_foreign_key "spell_class_list_joins", "class_lists"
  add_foreign_key "spell_class_list_joins", "spells"
  add_foreign_key "trait_proficiency_choice_joins", "proficiencies"
  add_foreign_key "trait_proficiency_choice_joins", "traits"
  add_foreign_key "trait_proficiency_granted_joins", "proficiencies"
  add_foreign_key "trait_proficiency_granted_joins", "traits"
end
