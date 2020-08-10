class MusicImporter

  attr_accessor :path, :files

  def initialize(path)
    @path = path
    @files = self.files
  end

def files
  @files = Dir.chdir(@path) {Dir.glob("*.mp3")}
end

def import
  @files.each do |filename|
    Song.create_from_filename(filename)
  end
end

end
