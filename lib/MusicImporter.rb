require 'pry'

class MusicImporter
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir.chdir(@path) do | path |
      Dir.glob("*.mp3")
    end
    @files
  end

  def import
    binding.pry
    @files.each do |file|
      Song.create_from_filename(file)
    end
  end
end


# [1] pry(#<MusicImporter>)> @files
# => ["Action Bronson - Larry Csonka - indie.mp3",
#  "Jurassic 5 - What's Golden - hip-hop.mp3",
#  "Real Estate - Green Aisles - country.mp3",
#  "Real Estate - It's Real - hip-hop.mp3",
#  "Thundercat - For Love I Come - dance.mp3"]


# @files.each do |file_name|
#   Song.create_from_filename(file_name)
# end
