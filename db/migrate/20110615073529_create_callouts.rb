class CreateCallouts < ActiveRecord::Migration
  def self.up
    create_table :callouts do |t|
      t.column :title, :string
      t.column :subtitle, :string
      t.column :url, :string
      t.column :position, :integer
      t.column :visible, :boolean, :default => true
      t.column :callout_file_name, :string  
      t.column :callout_content_type, :string  
      t.column :callout_file_size, :integer  
      t.column :callout_updated_at, :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :callouts
  end
end
