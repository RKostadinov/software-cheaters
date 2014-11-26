#you are given class014_homeweork
#find all the programs which difference of the two digits of the student number is less than 0
#all the files should be of type firstname_lastname_class_2014
#write in json using json_writer.rb
require_relative "json_writer.rb"
student = Hash.new()
Dir.glob("#{ARGV[0]}/**/*_*_*_*.rb").each do |directory| 
	firstName 	= directory.split("/").last.split("_").first.capitalize
	lastName 	= directory.split("/").last.split("_", 2).last.split("_").first.capitalize
	digits = directory.split("_").last.split(".").first.to_i
	
	firstDigit = digits / 10
	secondDigit = digits % 10
	
	if firstDigit - secondDigit < 0
		student[firstName] = lastName
	end
end
writer = JSONWriter.new()

writer.write(student)