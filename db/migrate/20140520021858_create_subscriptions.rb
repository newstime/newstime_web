class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :user, index: true
      t.references :publication, index: true
      t.boolean :active

      t.timestamps
    end
  end
end
