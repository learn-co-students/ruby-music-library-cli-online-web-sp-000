class MusicImporter

    attr_accessor :path

    def initialize(path)
        @path = path
    end
    
    def files
        mymp3s = Dir[path + "/*.mp3"].collect do |filename|
            File.basename(filename)
        end
    end
    
    def import
        files.each do |f|
            Song.create_from_filename(f)
        end
    end

end
