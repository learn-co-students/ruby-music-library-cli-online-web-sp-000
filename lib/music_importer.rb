class MusicImporter
  attr_accessor :path
  def initialize(path)
    @path = path
  end

  def files
    path = @path + "/*.mp3"
    @array = []
    all = Dir[path]
    all.each do |song|
      @array << song.split("mp3s/")[1]
    end
    @array
  end

  def import
    self.files
    @array.each {|file| Song.create_from_filename(file)}
  end

  def all
    @array
  end


end
