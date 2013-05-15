
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

	def self.Friends(r)
		require 'set'
		friends=Set.new
		r.direct_friends.each do |f|
			friends << f
		end
		r.inverse_friends.each do |f|
			friends << f
		end
		return friends 
	end

	def Friends(r)
		return self.Friends(r); 
	end

	def FriendsInfo(r)
		return ResearchersHelper.FriendsInfo(r)
	end


end
