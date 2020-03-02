class MusicImporter
    attr_accessor :path
    
    def initialize(path)
        @path = path
    end

    def files
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end
    
    def import 
        #import imports the files into the library by invoking 
        # Song.create_from_filename
        files.each { |file| Song.create_from_filename(file) }
    end

    
end