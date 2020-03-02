require_relative '../config/environment.rb'
require 'irb'

def reload!
	load './config/environment.rb'
end

IRB.start