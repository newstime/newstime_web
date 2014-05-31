class CreateEditionCopy < ActiveRecord::Migration
  def change
    create_table :edition_copies do |t|
      t.references :user, index: true
      t.references :edition, index: true

      t.timestamps
    end
  end
end
