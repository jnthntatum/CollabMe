module ResearchersHelper
	def self.FriendsInfo(r)
		friendsifo=[];
		r.friends.each do |f|
			friendsifo << {:first_name => f.first_name, 
				:last_name => f.last_name, :email => f.email} 
		end
		return friendsifo;  	
	end

	def Friends(r)
		return ResearchersHelper.FriendsInfo(r)
	end
end
