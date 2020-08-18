class MusicImporter
    attr_accessor :path
    #parses directory of files & sends gilenames to a song class
    #only gets mp3 files, from a directory
    def initialize(path)
        @path = path
    end

    def files
        Dir.entries(path).select{|song| !File.directory?(song) && song.end_with?(".mp3")}
    end

    def import
        files.each {|f| Song.create_from_filename(f)}
    end
end

#import imports the files into the library by invoking Song.create_from_filename