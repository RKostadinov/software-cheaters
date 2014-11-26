require 'rubygems'
require 'json'
require_relative './csvWriter.rb'


hash = Hash.new
new_hash = Hash.new

Dir.glob(ARGV[0] + "*.json").each do |json_file|

	json = File.read(json_file)
	hash = JSON.parse(json)

	hash.each do |first_name, last_name|
	
		if last_name.length <= 7 
		
			new_hash[first_name] = last_name
			
		end
	
	end

end

new_hash = new_hash.sort_by {|first, last| first}.reverse

a = CSVWriter.new
a.write(new_hash)
