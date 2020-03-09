require "pry"

class MusicImporter
	attr_accessor :path

	def initialize(filepath)
		@path = filepath
	end

	def files
		Dir.glob("#{@path}/*.mp3").collect do |filename|
			filename = filename.split("/").last
		end
	end

	def import
		self.files.each do |file|
			Song.create_from_filename(file)
		end
	end
	# binding.pry
end