class AddDurationToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :duration, :string
  end
end
