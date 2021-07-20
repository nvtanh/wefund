class CreatePitchDecks < ActiveRecord::Migration[6.1]
  def change
    create_table :pitch_decks do |t|
      t.string :title, null: false
      t.references :user, foreign_key: true
      t.integer :image_process, default: 0 # 0 is pending

      t.timestamps
    end
  end
end
