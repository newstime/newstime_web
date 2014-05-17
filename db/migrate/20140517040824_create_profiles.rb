class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :slug
      t.string :type
      t.references :user, index: true
      t.references :organization, index: true
      t.references :publication, index: true

      t.timestamps
    end

    add_index :profiles, :slug
  end
end
