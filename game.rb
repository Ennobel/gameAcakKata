def inputWord(file)
	words = Array.new
	data_read = IO.readlines(file)

	data_read.each do |word|
		words << word.chomp;
	end
	return words
end

def randomWord(word)
	random,random_word = Array.new,Array.new
	question = Hash.new	

	word.length.times do |index|
		random << index		
	end
	 random = random.shuffle
	 random.each do |randomIndex|	 	
		 random_word << word[randomIndex] 
	 end
	  question[word] = random_word.join()	 
	  return question	  
end

def checkingWord(test_case)		
	flag = false
	test_case.each do |key,val|			
		puts "TEBAK KATA : #{val} "
		print "JAWAB : "
		user_input = gets.chomp		
		user_input != key ? flag = false : flag = true						
	end		
	return flag
end

def gameOn(life)	
	points = 0
	level = 1	
	while (life > 0)					
		if points > 5 && points < 10
			level = 2
		elsif points > 10
			level = 3
		end
		words = inputWord("WordsBankLevel#{level}.txt")						
		test_case = randomWord(words[rand(0..words.length-1)])
		loop do
			system "clear"
			system "cls"
			puts "Game Tebak Kata Sederhana\n\n"
			puts "LEVEL : #{level}"
			puts "LIFE : #{life} POINTS : #{points} \n\n"					
			flag = checkingWord(test_case)
			if(flag == true)
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