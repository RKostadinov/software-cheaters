=begin
1. You are giving an argument for a folder with files;
	1.1 if ther are other arguments they should be discаrded
2. some files names in this folder are in the format First_Last_digits.rb. But there are also other files;
3. for each student calculate the DIGIT and write in CSV file only those that have sum more than 10;
4. in HTML file write those students that have DIGIT's sum less than 10;
5. the results must include the student's names and the DIGIT's sum;
6. sort the results by DIGIT's sum ASC for both folders;
7. The HTML file must be names result.html;
8. The CSV file must be named result.csv:


		FirstName5,LastName5,sum1
		FirstName2,LastName2,sum2
		FirstName9,LastName9,sum3
		...
		FirstName,LastName,sumN

Good luck!
=end
require "csv"
require './csv_writer.rb'
require './json_writer.rb'
require './xml_writer.rb'
require './html_writer.rb'
student = Hash.new { |name, programs| name[programs] = []}
student1 = Hash.new { |name, programs| name[programs] = []}
student2 = Hash.new { |name, programs| name[programs] = []}

class String
  def is_number?
    Float(self) != nil rescue false
  end
end

Dir.glob(ARGV[0]+"/**/*.*") do |repository|

	prog_name = repository.split("/").last
	name = prog_name.split("_").first.capitalize + "," + prog_name.split("_", 2).last.split("_").first.capitalize
	digit = prog_name.split("_").last.split(".").first

	if prog_name.include? "_" then counter = prog_name.count "_" end
	student["#{name}"] << digit.to_i if ((counter == 2) && (digit.is_number?))
end

student.each do |name, programs|
	sum = 0
	programs.each { |pr| sum += pr}
	if sum > 10 then student1["#{name}"] = sum
	elsif sum < 10 then student2["#{name}"] = sum end

	writer = CSVWriter.new
	writer.write student1
	writer = HTMLWriter.new
	writer.write student2
	writer = JSONWriter.new
	writer.write student1
	writer = XMLWriter.new
	writer.write student2
end
