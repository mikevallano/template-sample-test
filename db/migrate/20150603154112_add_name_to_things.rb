class AddNameToThings < ActiveRecord::Migration
  def change
    add_column :admin_things, :name, :string
    add_column :admin_things, :description, :string
  end
end
