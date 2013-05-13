
module ResearchersHelper 
	def self.FriendsInfo(r)
		require 'set'
		friendsifo=Set.new
		r.direct_friends.each do |f|
			friendsifo << {:first_name => f.first_name, 
				:last_name => f.last_name, :email => f.email} 
		end
		r.inverse_friends.each do |f|
			friendsifo << {:first_name =>f.first_name,
				:last_name => f.last_name, :email => f.email}
		end
		return friendsifo.to_a; 

	end

	def Friends(r)
		return ResearchersHelper.FriendsInfo(r)
	end
end
