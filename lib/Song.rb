class Song
attr_accessor :name
@@all = []

def initialize(name)
  @name = name
end


def self.all
  @@all
end

def self.destroy_all
  @@all = []
end

def save
  @@all << self
end

def self.create(name)
    new_song = initialize(name)
    new_song.save
    new_song
end

end
