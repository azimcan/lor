class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :associatedCards
      t.string :associatedCardRefs
      t.string :assets
      t.string :region
      t.string :regionRef
      t.string :attack
      t.string :cost
      t.string :health
      t.string :description
      t.string :descriptionRaw
      t.string :levelupDescription
      t.string :levelupDescriptionRaw
      t.string :flavorText
      t.string :artistName
      t.string :name
      t.string :cardCode
      t.string :keywords
      t.string :keywordRefs
      t.string :spellSpeed
      t.string :spellSpeedRef
      t.string :rarity
      t.string :rarityRef
      t.string :subtype
      t.string :subtypes
      t.string :supertype
      t.string :type
      t.string :collectible

      # Sonradan eklenenler
      t.string :gameAbsolutePath
      t.string :fullAbsolutePath

      t.timestamps
    end
  end
end
