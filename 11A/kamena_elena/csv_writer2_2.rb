require 'csv'
class CSVWriter
def write studentCOR
	CSV.open("results_Elena_Karakoleva_A_8.csv","w") do |csv|
			studentCOR.sort.each do |name, programs|
				names = name.split(",").flatten	
				csv << names
			end
		end
	end
end
