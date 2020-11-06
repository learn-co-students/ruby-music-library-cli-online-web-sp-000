class MusicImporter
    attr_accessor :path, :files

    def initialize(path)
        @path = path
        files
    end

    def files
        @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.sub("#{path}/", "") }
    end
    
    def import
        @files.each{|f| Song.create_from_filename(f)}
    end
end
