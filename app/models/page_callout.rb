class PageCallout < ActiveRecord::Base
  validates_uniqueness_of :callout_id, :scope => :editable_id
  
  belongs_to :editable, :polymorphic => true
  belongs_to :callout
  
  default_scope :order => 'position'
  
  acts_as_list
  
end
