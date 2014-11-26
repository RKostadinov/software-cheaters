require 'csv'

class CSVWriter

	def write(new_hash)
	
		CSV.open("result.csv", "w") do |csv|

			new_hash.each do |key, value|
			
				csv << [value, key]
			
			end

		end
	
	end

end
