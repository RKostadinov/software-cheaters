#you are given class014_homeweork
#find all the programs which length is more than 3 and the number of the student is odd
#all the files should be of type firstname_lastname_class_digits
#write in csv using csv_writer.rb
require_relative 'csv_writer.rb'
student = Hash.new()

Dir.glob("#{ARGV[0]}/**/*_*_*_*.rb").each do |directory| 
	firstName 	= directory.split("/").last.split("_").first.capitalize
	lastName 	= directory.split("/").last.split("_", 2).last.split("_").first.capitalize
	digits = directory.split("_").last.split(".").first.to_i
	if firstName.length > 3 && digits.odd?
		student[firstName] = lastName
	end
end
writer = CSVWriter.new()

writer.write(student)