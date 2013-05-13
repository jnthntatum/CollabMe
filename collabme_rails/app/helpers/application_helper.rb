module ApplicationHelper
	#map options for forms
	#probs not super necessary going forward but useful for now
	def self.MapOptions(arr, opt)
		opts = [];
		arr.map {|x| opts << [x.send(opt), x.id ]}
		return opts;
	end
end
