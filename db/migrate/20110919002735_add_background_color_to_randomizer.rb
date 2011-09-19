class AddBackgroundColorToRandomizer < ActiveRecord::Migration
  def self.up
    add_column :randomizers, :background_color, :string
    add_column :randomizers, :font_color, :string

  end

  def self.down
    remove_column :randomizers, :background_color
    remove_column :randomizers, :font_color

  end
end
