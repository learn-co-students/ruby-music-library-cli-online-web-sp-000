require 'pry'
class MusicImporter

  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def files
    file_array = Dir["#{path}/*"]
    file_array.collect do |file|
      simple_file = file.split("/")
      simple_file[4]
    end
  end

  def import
    self.files.each do |file|
      Song.create_from_filename(file)
    end
  end
end
