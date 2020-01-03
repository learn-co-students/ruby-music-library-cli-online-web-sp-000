require 'bundler'
Bundler.require

module Concerns
	module Findable
		def find_by_name(name)
			all.find{|obj| obj.name == name}
		end

		def create(name)
			obj = self.new(name)
			obj.save
		end

		def find_or_create_by_name(name)
			obj_by_name = find_by_name(name)
			obj_by_name = create(name) unless obj_by_name
			obj_by_name
		end
	end

	module Extras
		def normalize(files)
			files.map {|file_path| file_path.split('/').last}
		end

		def data_from_filename(file_name)
			file_name = file_name.gsub('.mp3', '').split(' - ')
			{song: file_name[1], artist: file_name[0], genre: file_name[2]}
		end
	end
end

require_all 'lib'
