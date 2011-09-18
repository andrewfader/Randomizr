class AddNameToJumpers < ActiveRecord::Migration
  def self.up
    add_column :jumpers, :name, :string
    add_column :jumpers, :position, :integer
    add_column :jumpers, :randomizer_id, :integer
    add_column :jumpers, :text, :text
  end

  def self.down
    remove_column :jumpers, :name
    remove_column :jumpers, :position
    remove_column :jumpers, :randomizer_id
    remove_column :jumpers, :text
  end
end
