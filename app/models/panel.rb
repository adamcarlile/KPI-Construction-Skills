class Panel < ActiveRecord::Base
  
  belongs_to :panelable, :polymorphic => true
  
end
