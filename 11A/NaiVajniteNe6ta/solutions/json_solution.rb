require_relative "jsonWriter.rb"
require 'csv'

hash = Hash.new

Dir.glob(ARGV[0] + "*.csv").each do |file|

	CSV.foreach(file) do |csv|
		
		count = 0
	
		char_csv = csv.to_s.split("")
		
		char_csv.each do |c|
		
			if c == "-"
			
				count += 1
			
			end
		
		end
		
		if count == 3 
			len = csv.to_s.length.to_i
			hash[csv] = len - 4
			
		end
	
	end

end

a = JSONWriter.new
a.write(hash)
