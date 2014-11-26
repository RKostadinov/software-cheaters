require 'csv'
require_relative "html_writer.rb"

names = Array.new

#check = true

CSV.foreach("#{ARGV[0]}/task.csv") do |word|
	
	check = true

	word = word.to_s
	word = word.split("\"")[1]
	word.split("").each do |char|
		if char.to_i != 0
			check = false 
		end
	end

	if check == true
		names.push(word)
	end
end
names = names.sort_by { |name| name.length  }
puts names

writer = HTMLwriter.new
writer.write names
