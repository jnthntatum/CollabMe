class ChatSession < ActiveRecord::Base
  attr_accessible :messages_blob, :drawables_blob
  has_one :userA, :class_name => "Researcher", :foreign_key => "userA_id"
  has_one :userB, :class_name => "Researcher", :foreign_key => "userB_id"

  def chat_info
  	data = {"messages" => self.messages_blob, "drawables" => self.drawables_blob}
  	return data
  end
end
