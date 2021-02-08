class CreatePostReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :post_replies do |t|
      t.text :comment
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
