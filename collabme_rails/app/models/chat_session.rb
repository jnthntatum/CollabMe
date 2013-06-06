class ChatSession < ActiveRecord::Base
  attr_accessible :message_blob, :drawing_blob
  has_one :userA, :class_name => "Researcher", :foreign_key => "userA_id"
  has_one :userB, :class_name => "Researcher", :foreign_key => "userB_id"

  def chat_info
  	data = {"messages" => self.message_blob, "drawables" => self.drawing_blob}
  	return data
  end
end
