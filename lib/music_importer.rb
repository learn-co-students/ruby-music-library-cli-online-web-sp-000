class MusicImporter
    def initialize(path)
        @path = path
    end

    def path
        @path
    end

    def files
    a = []
       a = Dir.entries(@path)
       b  = []
        a.map do |name|
            if name.include?("mp3")
         b  << name
            end
        end
    #    a.map {|name| name.include?("mp3")}
       b
        #   binding.pry
    end

    def self.MusicImporter
        @path.each do |file|
            Song.new(file)
        end
    end

    def import
        a = self.files
     a.each do |i| 
        Song.create_from_filename(i)
     end
    end
end