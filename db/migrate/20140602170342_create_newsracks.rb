class CreateNewsracks < ActiveRecord::Migration
  def change
    create_table :newsracks do |t|
      t.string :sprite_path
      t.string :edition_ids

      t.timestamps
    end
  end
end
