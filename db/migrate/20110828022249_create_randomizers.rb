class CreateRandomizers < ActiveRecord::Migration
  def self.up
    create_table :randomizers do |t|
      t.string :name
      t.integer :user_id
    end
  end

  def self.down
    drop_table :randomizers
  end
end
