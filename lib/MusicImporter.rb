require 'pry'
class MusicImporter

  attr_accessor :path

  def initialize(filename)
    @path = filename
  end

  def files
    all = []
    Dir.entries(@path).each {|x|
    chars = x.split(/[\/]/)
    all << chars.last if !all.include?(chars.last) && chars.last.include?("-")
  }
    return all
  end

  def import
    list = files
    list.each {|x|
    Song.create_from_filename(x)
    }
  end
end
