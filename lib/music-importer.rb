require 'pry'
class MusicImporter
  attr_accessor :path, :files
  def initialize(filepath)
    @path = filepath
    all_files = Dir.entries(@path)
    # binding.pry
    @files = all_files.select{|f| f.length >= 4}
  end
  def import
    self.files.each{|s| Song.create_from_filename(s)}
  end
end
