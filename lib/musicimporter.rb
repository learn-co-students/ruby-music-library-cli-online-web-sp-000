class MusicImporter
    attr_accessor :song, :artist
  
    def initialize (path)
        @path = path
    end

    def files
        Dir.glob(path+"**/*.mp3").map {|file| file.split("/")[4]}
    end    

    def import
       files.each do |file|        
          Song.create_from_filename(file)
        end
    end

    def path
        @path
    end
end