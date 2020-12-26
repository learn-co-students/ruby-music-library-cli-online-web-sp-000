require 'pry'
class MusicImporter

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        binding.pry
        Dir.glob("*.mp3") do |filename|

        end
    end

end