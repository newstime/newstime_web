class CreatePublicationsUsers < ActiveRecord::Migration
  def change
    create_table :publications_users, :id => false do |t|
      t.references :publication, :user
    end

    add_index :publications_users, [:publication_id, :user_id],
      name: "publications_users_index",
      unique: true
  end
end
