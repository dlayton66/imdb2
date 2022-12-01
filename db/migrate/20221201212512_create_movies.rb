class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.references :director, foreign_key: true
      t.string :title
      t.integer :runtime
      t.date :release
      t.boolean :like
      t.integer :dmst_gross
      t.integer :intl_gross

      t.timestamps
    end
  end
end
