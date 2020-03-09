class Genre
	extend Concerns::Findable

	attr_accessor :name, :songs

	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def self.create(name)
		genre = Genre.new(name)
		genre.save
		genre
	end

	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

	def save
		@@all << self
	end

	def add_song(song)
		song.genre = self if song.genre == nil
		@songs << song if !@songs.include?(song)
	end

	def artists
		@songs.collect { |song| song.artist }.uniq
	end
end
# binding.pry