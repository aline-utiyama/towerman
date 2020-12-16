class AddPeopleToEventAtendees < ActiveRecord::Migration[6.0]
  def change
    add_column :event_atendees, :people, :integer
  end
end
