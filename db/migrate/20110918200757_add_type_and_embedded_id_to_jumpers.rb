class AddTypeAndEmbeddedIdToJumpers < ActiveRecord::Migration
  def self.up
    add_column :jumpers, :jumper_type, :string
    add_column :jumpers, :embedded_id, :integer
    Jumper.update_all(:jumper_type => "text")
  end

  def self.down
    remove_column :jumpers, :jumper_type
    remove_column :jumpers, :embedded_id
  end
end
