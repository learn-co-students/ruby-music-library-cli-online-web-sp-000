require 'pry'
class MusicImporter
  extend Concerns::Findable
attr_accessor :path
  def initialize(path)
    @path = path
  end
#binding.pry
  def files
    Dir.children(@path)
  end

  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end #end of class MusicImporter
