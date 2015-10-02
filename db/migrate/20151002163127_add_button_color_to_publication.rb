class AddButtonColorToPublication < ActiveRecord::Migration
  def change
    add_column :publications, :button_color, :string
  end
end
