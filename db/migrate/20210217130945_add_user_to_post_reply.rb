class AddUserToPostReply < ActiveRecord::Migration[6.0]
  def change
    add_reference :post_replies, :user, null: false, foreign_key: true
  end
end
