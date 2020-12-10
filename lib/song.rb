class Song
	attr_accessor :name
	attr_reader :artist, :genre

	@@all = []

	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

	def self.create(name)
		new(name).tap{|song| song.save}
	end

	def self.find_by_name(name)
		all.find{|song| song.name == name}
	end

	def self.find_or_create_by_name(name)
		find_by_name(name) || create(name)
	end

	def self.new_from_filename(filename)
		song_data = filename.chomp(".mp3").split(" - ")
		artist = Artist.find_or_create_by_name(song_data[0])
		genre = Genre.find_or_create_by_name(song_data[2])

		new(song_data[1], artist, genre)
	end

	def self.create_from_filename(filename)
		new_from_filename(filename).save
	end

	def initialize(name, artist=nil, genre=nil)
		@name = name
		self.artist = artist if artist
		self.genre = genre if genre
	end

	def save
		@@all.push(self)
	end

	def artist=(artist)
		@artist = artist
		artist.add_song(self)
	end

	def genre=(genre)
		@genre = genre
		genre.songs.push(self) unless genre.songs.include?(self)
	end
end
