class MusicImporter

attr_accessor :path


def initialize(path = "./db/mp3s")
@path = path
end

def files
    #binding.pry
    Dir.entries(path).select do |file|
     file.size > 2 
    end
end

def import
    files.each { |file| Song.create_from_filename(file)}
end
end
