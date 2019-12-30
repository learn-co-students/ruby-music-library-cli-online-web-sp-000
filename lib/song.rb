class Song
	attr_accessor :name

	@@all = []

	def initialize(name, artist = nil)
		self.name=(name)
		@artist = artist if artist 
	end

	def self.all
		@@all
	end

	def self.destroy_all
		@@all = []
	end

	def save
		@@all << self
		self
	end

	def self.create(name)
		song = Song.new(name)
		song.save
	end

	def name=(name)
		@name = name
	end

	def artist 
		@artist
	end

	def artist=(artist)
		if !self.artist
			@artist = artist
		end
	end
end