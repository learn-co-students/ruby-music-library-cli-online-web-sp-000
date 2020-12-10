class Genre
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
		new(name).tap{|genre| genre.save}
	end

	def initialize(name)
		@name = name
		@songs = []
	end

	def save
		@@all.push(self)
	end

	def artists
	songs.map{|song| song.artist}.uniq
	end
end
