class ChatSessionsController < ApplicationController
	before_filter :require_login
	def save
		uid1 = session[:current_user_id].to_i
		uid2 = params[:uid].to_i
		message_blob = params[:message_blob]
		drawable_blob = params[:drawable_blob]
		if(uid1 > uid2)
			tmp = uid2;
			uid2 = uid1;
			uid1 = tmp;
		end
		sessions = ChatSession.where('userA_id = ? AND userA_id = ?', uid1, uid2)
		sess = nil; 
		if sessions
			sess = sessions[0]
		else
			sess = ChatSession.new; 
		end
		sess.message_blob = message_blob
		sess.drawable_blob = drawable_blob
		if (sess.save)
			respond_to do |f|
				f.json {render :json => {"success" => true}}
			end
		else
			respond_to do |f|
				f.json {render :json => {"success" => false}}
			end
		end
	end

	def read
		uid1=session[:current_user_id].to_i
		uid2=params[:uid].to_i
		if uid1 > uid2
			tmp = uid2;
			uid2 = uid1;
			uid1 = tmp;
		end
		sessions = ChatSession.where('userA_id = ? AND userB_id = ?', uid1, uid2)[0]
		if sessions
			sess = sessions[0]
			respond_to do |f|
				f.json {render :json => sess.chat_info }			
			end
		else
			respond_to do |f|
				f.json {render :json => {"success" => false, "reason" => "not found"} }
			end
		end
	end
end
