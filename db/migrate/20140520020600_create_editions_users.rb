class CreateEditionsUsers < ActiveRecord::Migration
  def change
    create_table :editions_users, :id => false do |t|
      t.references :edition, :user
    end

    add_index :editions_users, [:edition_id, :user_id],
      name: "editions_users_index",
      unique: true
  end
end
