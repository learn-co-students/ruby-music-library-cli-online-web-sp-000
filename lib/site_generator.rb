class SiteGenerator
  attr_reader :path

  def initialize(path)
    @path = path
    FileUtils.mkdir_p path
    FileUtils.mkdir_p "#{path}/artists"
  end

def generate_index
#  HEREDOC
# First load the template string
template_string = File.read("./lib/views/#{template}.erb")
# Instantiate the ERB template instance
template = ERB.new(template_string)
html = template.result

File.write("#{path}/index.html", html)
end

def call
  generate_index("index.html")
  generate_index("artists/index.html")
  generate_index("genres/index.html")
  generate_index("songs/index.html")
end

end

#index will read the view
#generate a template
#compile the template
#then write it 

#the content of the file in def generate_index
