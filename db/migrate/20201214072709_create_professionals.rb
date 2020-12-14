class CreateProfessionals < ActiveRecord::Migration[6.0]
  def change
    create_table :professionals do |t|
      t.string :full_name
      t.string :role
      t.text :details
      t.integer :price
      t.string :image
      t.string :email
      t.string :phone
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
