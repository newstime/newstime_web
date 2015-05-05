class AddRecentNewsrackToPublication < ActiveRecord::Migration
  def change
    add_column :publications, :recents_newsrack_id, :integer

    add_index :publications, :recents_newsrack_id
  end
end
