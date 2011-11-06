class CreatePageCallouts < ActiveRecord::Migration
  def self.up
    create_table :page_callouts do |t|
      t.column :callout_id, :integer
      t.references :editable, :polymorphic => :true
      t.column :position, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :page_callouts
  end
end
