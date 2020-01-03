class Song
	extend Concerns::Findable
	extend Concerns::Extras

	attr_accessor :name
	attr_reader :genre

	@@all = []

	def initialize(name, artist = nil, genre = nil)
		self.name=(name)
		self.artist=(artist) if artist 
		self.genre=(genre) if genre 
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
		artist.add_song(self)
	end

	def genre=(genre)
		@genre = genre
		genre.songs << self unless genre.songs.include?(self)
	end

	def self.new_from_filename(file_name)
		data = data_from_filename(file_name)

		artist = Artist.find_or_create_by_name(data[:artist])
		genre  = Genre.find_or_create_by_name(data[:genre])
		song   = self.find_or_create_by_name(data[:song])

		song.artist=(artist)
		song.genre=(genre)

		song
	end

	def self.create_from_filename(file_name)
		self.new_from_filename(file_name)
	end

end