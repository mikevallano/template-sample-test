class AddKittenIdtoPost < ActiveRecord::Migration
  def change
    add_column :posts, :kitten_id, :integer
  end
end
