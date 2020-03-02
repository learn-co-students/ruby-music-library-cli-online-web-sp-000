class Genre
	extend Concerns::Findable
	attr_accessor :name, :songs

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
		genre = Genre.new(name)
		genre.save
	end

	def name=(name)
		@name = name
	end

	def artists
		artists = []
		@songs.each {|song| artists << song.artist unless artists.include?(song.artist)}
		artists
	end
end