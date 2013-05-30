class Request < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :owner, :class_name => "Researcher", :foreign_key => "owner_id"
  belongs_to :request_interface, :polymorphic => true
end
