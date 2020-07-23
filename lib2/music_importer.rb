require 'pry'

require 'require_all'


class MusicImporter

  extend Concerns::Findable
  
  attr_accessor :path
  
  def initialize(path = '.db/mp3s')
    @path = path
  end

  def files
    @files = []
    file_folder = Dir.entries(@path)
    file_folder.each {|directory_file| @files << "#{directory_file}"}
    @files.delete_if{|character| character == "." || character == ".."}
    @files
  end
  
  def import
    files.collect{|file_name| Song.create_from_filename(file_name)}
  end
  
end
