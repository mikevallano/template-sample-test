class ChangeKittenIdtoGatitoId < ActiveRecord::Migration
  def change
    rename_column :events, :kitten_id, :gatito_id
  end
end
