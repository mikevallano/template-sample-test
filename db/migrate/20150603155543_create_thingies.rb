class CreateThingies < ActiveRecord::Migration
  def change
    create_table :thingies do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
