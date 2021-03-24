require 'pry'

class MusicImporter

    attr_accessor :path

    def initialize(path = "./db/mp3s")
        @path = path
    end

    def files
        all_file_names = Dir.entries(path).grep(/.mp3/)
    end

    def import
        files.each {|f| Song.create_from_filename(f)}
    end

end