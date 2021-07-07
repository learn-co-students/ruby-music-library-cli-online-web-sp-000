class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.entries(@path).select { |file| file[/.*.mp3/] }
  end

  def import
    self.files.each do |file|
      song = Song.create_from_filename(file)
    end
  end
end