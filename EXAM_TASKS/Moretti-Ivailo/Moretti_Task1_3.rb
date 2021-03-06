#you are given class014_homeweork
#find all the programs with last name greater than 6 and the number of the student is even
#all the files should be of type firstname_lastname_class_2014
#write in csv using csv_writer.rb
require_relative 'csv_writer.rb'
student = Hash.new()

Dir.glob("#{ARGV[0]}/**/*_*_*_*.rb").each do |directory| 
	firstName 	= directory.split("/").last.split("_").first.capitalize
	lastName 	= directory.split("/").last.split("_", 2).last.split("_").first.capitalize
	digits = directory.split("_").last.split(".").first.to_i
	if lastName.length > 6 && digits.even?
		student[firstName] = lastName;
	end
end
writer = CSVWriter.new()

writer.write(student)

