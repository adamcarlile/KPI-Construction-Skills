class CreateCourseEvents < ActiveRecord::Migration
  def self.up
    create_table :course_events do |t|
      t.references :course
      t.column :title, :string
      t.column :body, :text
      t.column :spaces, :integer
      t.column :price_cents, :integer, :default => 0, :null => false
      t.column :currency, :string
      t.column :start_date, :datetime
      t.column :finish_date, :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :course_events
  end
end
