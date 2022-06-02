class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.string :text, null: false
      t.integer :votes_count, default: 0
      t.belongs_to :poll, null: false, foreign_key: true

      t.timestamps
    end
  end
end
