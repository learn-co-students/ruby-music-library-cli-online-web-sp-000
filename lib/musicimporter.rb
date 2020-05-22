require 'pry'
class MusicImporter
  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.glob("#{@path}/*").map do |i|
      i.gsub("#{@path}\/", "")
    end
    # binding.pry
  end

  def import
    # creates a new song instance for each files
    files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
