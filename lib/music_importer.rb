class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
      @path = path
    end

    def files
      @files = Dir.glob("#{path}/*.mp3").map { |file| file.gsub("#{path}/", "") }

    end

def import
  files.each {|s| Song.create_from_filename(s)}
end

end
