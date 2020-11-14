require_relative "../config/environment.rb"

class MusicImporter
  attr_accessor :path, :files

  def initialize(file_path)
    @path = file_path
    @files = Dir.entries(@path).reject {|file| file == "." || file == ".."}
  end

  def import
    self.files.each {|file| Song.create_from_filename(file)}
  end

end
