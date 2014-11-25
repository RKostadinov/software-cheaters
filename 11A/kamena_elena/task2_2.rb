=begin
Develop a program named FirstName_LastName_ClassNumber_<%=@task_number%>.rb

1. you are given an argument for a folder with files;
1.1 if there are other arguments they should be discarded
2. some file names in this folder are in the form First_Last_DIGITS.rb. But there are also other files; 
3. find all the students with WRONG file's name and write them in JASIN file;
4. find all the students with CORRECT file's name and write them in CSV file;  
5. Sort the result by FirstName DESC for both.
5. Produce a result in CSV format named result.csv:

		FirstName1,LastName1
		FirstName2,LastName2
		...
		FirstNameN,LastNameN
=end
require './csv_wr.rb'
require './json_wr.rb'
require './html_wr.rb'
require './xml_wr.rb'
require "csv"
studentCOR = Hash.new{|hash, key| hash[key] = []}
student1 = Hash.new{|hash, key| hash[key] =[]}
studentWRO = Hash.new{|hash, key| hash[key] =[]}

class String
  def is_number?
    Float(self) != nil rescue false
  end
end

Dir.glob(ARGV[0]+"*.rb").each do |file|
	first_name = file.split(/\//).last.split(/_/).first	
	last_name = file.split(/\//).last.split(/_/, 2).last.split("_").first.split(".").first
	task_number = file.split(/\//).last.split("_").last.split(".").first
	file_split = file.split(/\//).last
    	p=file_split.split("_").length


	if ((first_name == "") || (first_name == " ") || (last_name == "") || (last_name == " ") || (p != 3) || (task_number.is_number? == false))
		studentWRO["#{first_name},#{last_name}"] << task_number.to_i
	end
        if ((first_name != "") && (first_name != " ") && (last_name != "") && (last_name != " ") && (p == 3) && (task_number.is_number?))
		studentCOR["#{first_name},#{last_name}"] << task_number.to_i
	end
end

writer = CSVWriter.new
writer.write studentCOR
writer = JSONWriter.new
writer.write studentWRO
writer = HTMLWriter.new
writer.write studentCOR
writer = XMLWriter.new
writer.write studentCOR
