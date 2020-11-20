require 'pry'

class MusicImporter
  attr_accessor :path

  def initialize(file_path)
    @path = file_path
  end

  def files
    Dir.children(self.path)
    # Dir.children(@path)
  end

  def import
    files.each do |file_name|
      Song.create_from_filename(file_name)
    end
  end
end
