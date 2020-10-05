require 'pry'
class MusicImporter

    def initialize(path)
        @path = path
    end 

    def path
        @path
    end 

    def files
        files = Dir.glob("*.mp3", base: path)
    end 

    def import
        files.each do |file|
        Song.create_from_filename(file)
        end 
    end 
end 