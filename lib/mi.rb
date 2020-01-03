class MusicImporter
	include Concerns::Extras

	attr_accessor :path

	def initialize(path)
		@path = path
	end

	def files
		normalize(Dir[path + "/*"])
	end

	def import
		self.files.each {|file_name| Song.create_from_filename(file_name)}
	end

end