require 'pry'

class Song
    extend Findable
    extend Persistable::ClassMethods
    include Persistable::InstanceMethods
    
    attr_accessor :name
    attr_reader :artist, :genre

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
    end


    # def self.create(name)
    #     new(name).save
    # end

end