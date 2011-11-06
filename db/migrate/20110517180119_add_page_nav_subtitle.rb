class AddPageNavSubtitle < ActiveRecord::Migration
  def self.up
    add_column :pages, :nav_subtitle, :text
  end

  def self.down
    remove_column :pages, :nav_subtitle
  end
end