require 'pry'

class MusicImporter
  def initialize(filepath)
    @path = filepath
  end

  def path
    @path
  end

  def files
    @files = Dir.entries(path).select{|f| f.include?(".mp3")}
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end

  def parse(name)
    name = name.chomp!(".mp3")
    name = name.split(" - ")
    order = [1,0,2]
    name_sorted = name.values_at *order
    name_sorted
  end

end
