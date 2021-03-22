class Word
  # Stores the provided word in an instance variable
  def initialize(word)
    # split the mystery word into an array of letters and save to an instance variable
@array_of_letters = word.split("")
    # map through the letters array, replacing each letter with an underscore.
   @array_of_underscore = @array_of_letters.map{ |i| i="_"}
    # this will represent the displayed letters save this to an instance variable.
  end
 
  
  def guess?(letter)
    # use conditional logic to check whether
    # the array of letters includes the guessed letter.
if(@array_of_letters.include? letter)
  @array_of_letters.each_with_index do |each_letter,index|
    if  each_letter == letter
      @array_of_underscore.insert(index,letter).delete_at(index+1)
    end
  end
  pp 'You were right!'
  return true
else
  pp 'you were wrong'
  return false
end
    # if it does, inform the user that they were right
    # and this .guess? method should return true. 
    # if not, inform the user that they're wrong
    # and have the .guess? method return false.


    # loop through the letters array with index. 
    # if the guessed letter matches a character, 
    # replace the underscore at that index with the guessed letter.
   
    # *** REMINDER: ? methods must return a boolean ***
  end
  
  def guessed_all_correct?
    if(@array_of_underscore.join == @array_of_letters.join)
      pp 'All letters have been guessed correctly'
      true
    else
      false
    end
  
    # Check whether all letters in the word have been guessed correctly.
  end

  def output_word
    pp @array_of_underscore.join
    # puts @array_of_letters.join
    # Display the current state of the guessed word for the player.
  end
end

class MysteryWordGame
  def initialize
  # Initialize the amount of lives, the ask_for_word method, and the game loop.
  @lives = 5
  ask_for_word
  game_loop
  end

  def ask_for_word
  pp "What is the mystery word?"
  mystery_word = gets.chomp
  @new_word= Word.new(mystery_word)
  # ask the user for a mystery word and save it to an instance variable 
  end

  def game_loop
    # Run the game loop until the player wins or loses.
    loop do
      # show the current output of the word
      @new_word.output_word
      # inform the user how many lives they have left
puts "you have #{@lives} lives left"
      # ask the user to guess a letter and save their guess to a local variable
puts "Guess a letter"
@letter =  gets.chomp

      # (BONUS) Check whether a provided character is a letter
      # (BONUS) check and  ensure the user only entered one letter    

      # use the .guess?(letter) method to check if the user's guess was correct
      # save the result to an instance variable
@result = @new_word.guess?(@letter)
if(@result == false)
  pp  'You lost a life'
  @lives = @lives -1
end
      # if the guess was wrong, the player loses a life
if(@lives == 0)
  pp 'you lost the game'
  break
end

if(@new_word.guessed_all_correct?)
'you win!'
break
end
    end
  end
end

MysteryWordGame.new
