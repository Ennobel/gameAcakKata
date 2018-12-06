require_relative 'Test_case'

def inputWord(file)
	words = Array.new
	data_read = IO.readlines(file)

	data_read.each do |word|
		words << word.chomp;
	end
	return words
end

def levelDesc(level)
	case level
		when 1
		 	levelDesc = "EASY"
		when 2
			levelDesc = "HARD"
		when 3
			levelDesc = "IMPOSSIBLE"
	end
	return levelDesc
end

def gameOn(life)		
	# checking run on windows or not
	is_windows = (ENV['OS'] == 'Windows_NT') 			 

	points = 0
	level = 1	

	#checking points for next level
	while (life > 0)					
		if points > 5 && points < 10
			level = 2
		elsif points > 10
			level = 3
		end

		testCase = Test_case.new (inputWord("WordsBankLevel#{level}.txt"))

		loop do								
			# clearing command line view
			if is_windows
			 	system "cls"
			else
			 	system "clear"
			end
			 
			puts "Game Tebak Kata Sederhana\n\n"
			puts "LEVEL : #{levelDesc(level)}"
			puts "LIFE : #{life} POINTS : #{points} \n\n"					
			
			testCase.test_case.each do |key,val|
				puts "TEBAK KATA : #{val} "
				print "JAWAB : "
			end								
			flag = testCase.checkingWord(gets.chomp)	
						
			if(flag)
				puts "\nJawaban anda benar \n\n"
				sleep(0.5)
				points +=1
			else	
				life -=1				
				if life > 0
					puts "\nJawaban anda salah silahkan coba lagi \n\n"								
					sleep(0.5)
				else
					puts "\n\nGAME OVER \n\n"								
				end								
			end					
		break if (flag == true || life == 0)
		end
	end
	return points
end
# life = 3
point = gameOn(3)
puts "Nilai akhir anda : #{point}"