require_relative 'task.rb'

class Task2 < Task

	def init_contexts

		context1_1 = {
			:task_number=>"1",
			:what_to_find=>"all the programs that have flog under 200",
			:which_to_sort => "First name",
			:in_what_order => "ASC",
			:file_format => "JSON",
			:expected=>
"
{
  \"Nikolay\": \"Mihailov\",
  \"Ivailo\": \"Ivanov\",
  \"Hristiyan\"\: \"Velyakov\",
  \"Veselin\": \"Dechev\",
  \"Kalin\": \"Marinov\",
  \"Iliyan\": \"Germanov\",
 \"Dimitar\": \"Matev\",
  \"Marian\": \"Belchev\",
  \"Denis\": \"Stoinev\",
  \"Hristo\": \"Dachev\",
  \"Vasil\": \"Kolev\",
  \"Stefan\": \"Iliev\"
}
"
		}
	
		context1_2 = {
			:task_number=>"1",
			:what_to_find=>"all the programs that have flay between 1 and 10",
			:which_to_sort => "First name",
			:in_what_order => "ASC",
			:file_format => "CSV",
			:expected=>
"
Atanaska,Ivancheva
Borislav,Rusinov
David,Georgiev
Dimitar,Terziev
Elena,Karakoleva
Georgi,Velev
Gergan,Nikolov
Hristiyan,Velyakov
Ivelin,Slavchev
Ivo,Valchev
Kaloyan,Nikov
Kamena,Dacheva
Konstantin,Kostov
Krassen,Angelov
Kristina,Pironkova
Lili,Kokalova
Lubomir,Yankov
Mladen,Karadimov
Nikola,Marinov
Petko,Bozhinov
Radoslav,Kostadinov
Simeon,Shopkin
Stanimir,Bogdanov
Stanislav,Valkanov
Stefan,Iliev
Tihomir,Lidanski
Valentin,Georgiev
Vanya,Santeva
Velislav,Kostov
Veselin,Dechev
Veselina,Kolova
"
		}
		
		context1_3 = {
			:task_number=>"1",
			:what_to_find=>"all the programs that have flog between 200 and 350",
			:which_to_sort => "First name",
			:in_what_order => "ASC",
			:file_format => "CSV",
			:expected=>
"
Atanaska,Ivancheva
Dimitar,Terziev
Elena,Karakoleva
Emiliqn,Sokolov
Georgi,Velev
Hristiyan,Velyakov
Iosyf,Saleh
Ivelin,Slavchev
Ivo,Valchev
Kaloyan,Nikov
Kamena,Dacheva
Konstantin,Kostov
Krassen,Angelov
Lili,Kokalova
Lubomir,Yankov
Martin,Grigorov
Nikola,Marinov
Petko,Bozhinov
Simeon,Shopkin
Stanimir,Bogdanov
Stanislav,Valkanov
Stefan,Radev
Tihomir,Lidanski
Valentin,Georgiev
Vanya,Santeva
Velislav,Kostov
Veselin,Dechev
Veselina,Kolova

"
		}
		[context1_1, context1_2, context1_3]
	end
	
	def initialize
		super 'task2.eruby'
	end
	
end
