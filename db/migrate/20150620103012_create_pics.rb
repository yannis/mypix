class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      enable_extension 'hstore' unless extension_enabled?('hstore')
      t.text :description
      t.belongs_to :user, index: true, foreign_key: true
      t.hstore :exifs

      t.timestamps null: false
    end
  end
end
