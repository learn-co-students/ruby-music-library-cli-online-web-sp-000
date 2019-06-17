class MusicImporter
  attr_reader :path

  @@all = []

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{path}/*").map{ |file| file.gsub("#{path}/", '') }
  end

  #def import
    #self.files.each {|f| Song.new_by_filename(f)}
#  end
end
