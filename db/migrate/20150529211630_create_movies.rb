class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.float :imdb_rating
      t.string :runtime
      t.string :genre
      t.text :plot

      t.timestamps null: false
    end
  end
end
