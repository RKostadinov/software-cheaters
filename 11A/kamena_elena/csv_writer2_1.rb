require 'csv'
class CSVWriter
	def write student1
		CSV.open("results_Kamena_Dacheva_A_13.csv","w") do |csv|
			student1.sort_by{|k, v| v}.each do |name, sum|
				csv << [name,sum].flatten
			end
		end
       end
end
