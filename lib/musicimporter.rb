class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    my_files = Dir.entries(@path)
    return_files = []
    my_files.each do |file|
      return_files << file if file.scan(/[.]\w+/)[0] == ".mp3"
    end
    return_files
  end

  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end

end
