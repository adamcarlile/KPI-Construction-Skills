class Callout < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :url
  validates_presence_of :callout
  
  has_many :page_callout
  
  #Current used scopes
  default_scope :order => 'position' 
  named_scope :invisible, :order => 'position', :conditions => 'visible = 0'
  named_scope :visible, :order => 'position', :conditions => 'visible = 1'
  
  acts_as_list
  
  #Attached file options
  attachment_options = {
     :url => "/upload/:rails_env/callouts/:id/:style_:basename.:extension",
     :path => ":rails_root/public/upload/:rails_env/callouts/:id/:style_:basename.:extension",
     :styles => { 
       :homepage   => "160x125#",
       :standard   => "220x90#",
       :large      => "300x300",
       :icon       => "55x85#"
     }
   }
   
  has_attached_file :callout, attachment_options
  
end
