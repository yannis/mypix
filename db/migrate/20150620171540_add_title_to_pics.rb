class AddTitleToPics < ActiveRecord::Migration
  def change
    add_column :pics, :title, :string
  end
end
