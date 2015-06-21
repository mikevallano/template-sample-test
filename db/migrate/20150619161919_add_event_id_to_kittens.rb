class AddEventIdToKittens < ActiveRecord::Migration
  def change
    add_column :kittens, :event_id, :integer
  end
end
