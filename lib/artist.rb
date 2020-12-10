class Artist
	extend Concerns::Findable

	attr_accessor :name
	attr_reader :songs

	@@all = []

	def self.all
		@@all
	end

	def self.destroy_all
		@@all.clear
	end

	def self.create(name)
		new(name).tap{|artist| artist.save}
	end

	def initialize(name)
		@name = name
		@songs = []
	end

	def save
		@@all.push(self)
	end

	def add_song(song)
		song.artist = self if !song.artist
		songs.push(song) if !songs.include?(song)
	end

	def genres
		songs.map{|song| song.genre}.uniq
	end
end
