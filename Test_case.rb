class Test_case
	attr_reader :test_case
	attr_writer :test_case
	
	def initialize(words)
		@words = words		
		@test_case = randomWord(@words[rand(0..@words.length-1)])
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
	 # retrun hash with (["word"] = randomWord)
	 question[word] = random_word.join()	 
	return question	  
    end

    def checkingWord(user_input)		
	flag = false
	# @test_case.each do |key,val|			
		# puts "TEBAK KATA : #{val} "
		# print "JAWAB : "
		# user_input = gets.chomp		
		user_input.casecmp(test_case.keys[0]) != 0 ? flag = false : flag = true								
	# end			
	return flag
end
end