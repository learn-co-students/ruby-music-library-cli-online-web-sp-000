class MusicImporter

    def initialize(path)
        @path = path
    end

    def path
        @path
    end

    def files
        all_files = []
        Dir.entries(path).each do |entry|
            if entry.to_s[entry.to_s.length - 3, entry.to_s.length] == "mp3"
                all_files << entry
            end
        end

        all_files
    end

    def import
        files.each do |song|
            Song.create_from_filename(song)
        end
    end

end