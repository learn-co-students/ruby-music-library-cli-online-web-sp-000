module Concerns
	module Findable
		def find_by_name(name)
			all.detect do |a|
				a.name == name
			end
		end

		def find_or_create_by_name(name)
			if !!find_by_name(name) == false
				self.create(name)
			else
				find_by_name(name)
			end
		end
	end
end