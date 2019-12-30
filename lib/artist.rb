class Artist
	attr_accessor :name

	@@all = []

	def initialize(name)
		self.name=(name)
		@songs = []
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
		artist = Artist.new(name)
		artist.save
	end

	def name=(name)
		@name = name
	end

	def songs
		@songs
	end

	def add_song(song)
		@songs << song if !@songs.include?(song)
		song.artist=(self)
	end
end