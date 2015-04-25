class CreateNewsOrganizationInquiries < ActiveRecord::Migration
  def change
    create_table :news_organization_inquiries do |t|
      t.string :name
      t.string :email
      t.string :organization

      t.timestamps
    end
  end
end
