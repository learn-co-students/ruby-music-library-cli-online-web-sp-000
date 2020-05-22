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
       
       b
        #   binding.pry
    end

    def self.MusicImporter
        @path.each do |file|
            Song.new(file)
        end
    end

end