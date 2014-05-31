class AddSizeToEdition < ActiveRecord::Migration
  def change
    add_column :editions, :size, :float
    add_column :editions, :size_units, :string
  end
end
