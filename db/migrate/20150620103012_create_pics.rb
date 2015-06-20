class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.text :description
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
