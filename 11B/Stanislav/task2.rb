=begin
Develop a program named FirstName_LastName_ClassNumber_<%=@task_number%>.rb
You are given an argument for a folder with files.
Count how many times the word "software" occurs in each of the files.
Sort the result by times the word is found in DESC.
Produce a result in CSV format named result.csv
=end

require 'csv'
count_hash = Hash.new

Dir.glob("#{ARGV[0]}/**/*.*").each do |raw_file|
	i = 0
	filename = raw_file.split("/").last
	count_hash[filename] = 0
	file = File.open("#{raw_file}")
	file_read = file.readlines
	file_read.each do |line|
		words = line.split(" ")
		words.each do |word|
			if word == "software"
				i += 1
				count_hash[filename] = i
			end
		end
	end
end

count_hash = count_hash.sort_by{|key,val| val}.reverse

CSV.open("results.csv","w") do |csv|
	count_hash.each do |key,value|
		csv << [key,value]
	end
end