class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir.new(@path).each do |file|
      files << file if file.include? "mp3"
    end
    files
  end

  def import
    files.each { |filename| Song.create_from_filename(filename)}
  end

end
