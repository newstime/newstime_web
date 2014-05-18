class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :path
      t.string :type
      t.references :user, index: true
      t.references :organization, index: true
      t.references :publication, index: true

      t.timestamps
    end

    add_index :pages, :path
  end
end
