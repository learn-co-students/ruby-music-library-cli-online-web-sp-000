require "pry"
class Song
	attr_accessor :name, :artist, :genre

	@@all = []

	def initialize(name, artist = nil, genre = nil)
		@name = name
		self.artist = artist
		self.genre = genre
	end

	def self.create(name)
		song = Song.new(name)
		song.save
		song
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

	def artist=(artist)
		@artist = artist
		artist.add_song(self) if artist != nil
	end

	def genre=(genre)
		@genre = genre
		genre.add_song(self) if genre != nil
	end

	def self.find_by_name(name)
		@@all.detect do |song|
			song.name == name
		end
	end

	def self.find_or_create_by_name(name)
		if !!self.find_by_name(name) == false
			Song.create(name)
		else
			self.find_by_name(name)
		end
	end

	def self.new_from_filename(filename)
		filename = filename.gsub(".mp3", "")
		filename_array = filename.split(" - ")

		f_song = filename_array[1]

		f_artist = filename_array[0]
		artist_i = Artist.find_or_create_by_name(f_artist)

		f_genre = filename_array[2]
		genre_i = Genre.find_or_create_by_name(f_genre)

		Song.new(f_song, artist_i, genre_i)
	end

	def self.create_from_filename(filename)
		song = new_from_filename(filename)
		song.save
		song
	end
end
# binding.pry