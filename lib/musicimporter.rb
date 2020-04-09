class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{@path}/*.mp3").collect do |filename|
      File.basename(filename)
    end
  end

  def library
    @library
  end

  def import
    @library = files.collect do |file|
      Song.create_from_filename(file)
    end
  end

end
