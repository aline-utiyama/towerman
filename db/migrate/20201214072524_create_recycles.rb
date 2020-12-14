class CreateRecycles < ActiveRecord::Migration[6.0]
  def change
    create_table :recycles do |t|
      t.string :title
      t.string :image
      t.text :details
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
