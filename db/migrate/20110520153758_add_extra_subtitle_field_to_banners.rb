class AddExtraSubtitleFieldToBanners < ActiveRecord::Migration
  def self.up
    add_column :banners, :subtitle, :string
  end

  def self.down
    remove_column :banners, :subtitle
  end
end