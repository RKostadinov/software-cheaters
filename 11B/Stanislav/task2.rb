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
		line.split(" ").each do |word|
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

#na xml uslovieto e da se tursi hardware i se sortva v ASC
#XML NE SE TABULIRA (pone v moeto uslovie)

File.open("results.xml","w") do |xml|
	xml.write("<results>\n")
	count_hash.each do |key,value|
		xml.write("<#{key}>#{value}</#{key}>\n")
	end
	xml.write("</results>")
end

#na json uslovieto e da se tursi tues i se sortva v ASC

k = 0 #s k pochva da slaga zapetai ot vtoriq element, naburzo go izmislih ako nqkoi ima po-dobur variant da mi go edit
File.open("results.json","w") do |json|
	count_hash.each do |key,value|
		if k >= 1
			json.write(",")
		end
		json.write("\"#{key}\":#{value}")
		k += 1
	end
end
