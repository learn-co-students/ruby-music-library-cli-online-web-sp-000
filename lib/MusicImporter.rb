class MusicImporter
    def initialize(path)
        @path = path
    end
    def path
        @path
    end
    def files
        @files = []

        @files = Dir[@path + "/*"]
        @files = @files.map {|file| file[(@path.size + 1) .. -1]}
             
        #binding.pry
    end
    def import
        files
        #binding.pry
        @files.each {|file| Song.create_from_filename(file)}
        
    end
end