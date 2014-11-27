=begin
Develop a program named FirstName_LastName_ClassNumber_<%=@task_number%>.rb

1 You are given a folder with files.The Folder is passed as first argument;
2 Find all csv files wich sum of (lines) and (values in each line) is <%= @number %>. {sum = a + b,where a is lines and b is values in each line}
3 Output the results in <%=@format%> file that contains as result filename and line numbers.The order in wich results are written is by lines in each file in <%=@order%> order.The <%=@format%> file is named result.<%=@format%>.
order = DESK
format = json/xml
<%= @to_expect %>
=end
require 'csv'
require 'json'

h = Hash.new
a = Array.new
Dir.glob("#{ARGV[0]}/**/*.csv") do |f|

	i = 0
	CSV.foreach(f) do |row|
			a[i] = row
			i = i +1
		end

	f = f.split(/\//).last.split(/\./).first

	sum = a.size + a.first.size

	if sum = ARGV[1]
		h[f] = a.size.to_s
	end

end

p h

File.open("result.json","w") do |j|

	h = Hash[h.sort.reverse {|k,v| k[1] <=> v[1]}]
	j << h.to_json
end

File.open("result.xml","w") do |r|
	
	r << "<results>\n"
	h = Hash[h.sort.reverse {|k,v| k[1] <=> v[1]}]	
	h.each_key do |k|
		r <<"\t<tag#{k}>#{h[k]}</tag#{k}>\n"
	end

	r << "</results>"
	r.close
end

#SUM moje da e SUB ili MUL saotvetno tr da smenite formulite :)
