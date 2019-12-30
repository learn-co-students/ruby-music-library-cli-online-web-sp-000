class Genre
	attr_accessor :name

	@@all = []

	def initialize(name)
		self.name=(name)
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
end