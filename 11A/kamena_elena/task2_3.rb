=begin
1. Read from CSV file and write in HTML file only those that have less than 8 letters in their first name;
2. there are FirstName and SecondName separated by commas in the CSV file;
3. sort the results by last name DESC;
4. The HTML file must be named results_FirstName_LastName_ClassNumber.html:

		<html>
		<table>
		<tr>
		<th>firstName1</th>
		<th>lastName1</th>
		</tr>
		<tr>
		<th>firstName2</th>
		<th>lastName5</th>
		</tr>
		...
		<tr>
		<th>firstNameN</th>
		<th>lastNameN</th>
		</tr>
		</table>
		<html>
 
Good luck!
=end

require './csv_writer2_3.rb'
require './json_writer2_3.rb'
require './xml_writer2_3.rb'
require './html_writer2_3.rb'
student2 = Hash.new { |name, programs| name[programs] = []}

File.open('program.csv', 'r') do |f1|
	while line = f1.gets  
		firstName = line.split(",").first
		lastName  = line.split(",").last.split("\n").first
		length = lastName.length - 1
		if length < 8 then student2["#{firstName}"] = lastName end
	end  
end 

writer = CSVWriter.new
writer.write student2
writer = HTMLWriter.new
writer.write student2
writer = JSONWriter.new
writer.write student2
writer = XMLWriter.new
writer.write student2
