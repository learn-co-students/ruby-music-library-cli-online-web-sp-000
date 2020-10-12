class MusicImporter
    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files
        @files ||= Dir.chdir(@path) {|path| Dir.glob("*.mp3")}
    end

    def import
       files.each {|file_name| Song.create_from_filename(file_name)} 
    end
    

end