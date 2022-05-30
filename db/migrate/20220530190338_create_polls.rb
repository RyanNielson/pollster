class CreatePolls < ActiveRecord::Migration[7.0]
  def change
    create_table :polls do |t|
      t.string :slug, null: false
      t.string :text, null: false

      t.timestamps
    end

    add_index :polls, :slug, unique: true
  end
end
