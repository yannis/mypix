class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
    end
    add_index :users, :name
  end
end
