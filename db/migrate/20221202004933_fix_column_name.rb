class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :directors, :surname, :lastname
  end
end
