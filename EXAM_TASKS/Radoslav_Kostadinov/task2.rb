=begin
Develop a program named FirstName_LastName_ClassNumber_<%=@task_number%>.rb

1. you are given an argument for a folder with files;
1.1 if there are other arguments they should be discarded
2. some file names in this folder are in the format Firstname_LastName.csv . But there are also other files; 
3. find all the CSV files that are in the format Firstname_LastName.csv which include <%= @string %> in the file.
4. Sort the result by <%= @which_to_sort %> <%= @in_what_order %>.
5. Produce a result in HTML format named result.html:

<html>
	<ul>
		<li>FirstName1,LastName1</li>
		<li>FirstName2,LastName2</li>
		...
		<li>FirstNameN,LastNameN</li>
	</ul>
<html>
=end
require_relative 'html_writer.rb'
require 'csv'
directory = ARGV[0]
correct_files = Hash.new
Dir.glob("#{directory}*_*.csv") do |file|  
			file_name = file.split("/").last
			first = file_name.split("_").first
			last = file_name.split(".").first.split("_").last	
if file_name.count("_") == 1 then
			CSV.foreach(file) do |row|
 				if row.include? "correct" 
 						correct_files[first] = last
				end
			end
		end
end	
writer = HTMLWriter.new
writer.write correct_files