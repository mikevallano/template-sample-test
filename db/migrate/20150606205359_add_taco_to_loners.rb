class AddTacoToLoners < ActiveRecord::Migration
  def change
    add_column :loners, :taco, :string
  end
end
