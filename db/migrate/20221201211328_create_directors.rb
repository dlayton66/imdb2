class CreateDirectors < ActiveRecord::Migration[5.2]
  def change
    create_table :directors do |t|
      t.string :firstname
      t.string :surname
      t.boolean :alive
      t.integer :age

      t.timestamps
    end
  end
end
