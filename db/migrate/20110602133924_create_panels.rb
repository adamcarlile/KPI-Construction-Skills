class CreatePanels < ActiveRecord::Migration
  def self.up
    create_table :panels do |t|
      t.references :panelable, :polymorphic => :true
      t.column :title, :string
      t.column :body, :text
      t.timestamps
    end
  end

  def self.down
    drop_table :panels
  end
end
