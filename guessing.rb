file = File.open("words.txt")
file_data = file.readlines.map(&:chomp)
$file_data = file_data.reject{|c| c.empty?}
$guessed_letters = []

class Word
  def initialize(word)
@array_of_letters = word.split("")
   @array_of_underscore = @array_of_letters.map{ |i| i="_"}
  end
 
  
  def guess?(letter)
    
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
  end
  
  def guessed_all_correct?
    if(@array_of_underscore.join == @array_of_letters.join)
      pp 'All letters have been guessed correctly'
      true
    else
      false
    end
  
  end

  def output_word
    pp "The word currently looks like: #{@array_of_underscore.join}"
  end
  def solution
    pp "You lose the word was #{@array_of_letters.join}"
  end
end

class MysteryWordGame
  def initialize
  # Initialize the amount of lives and the game loop.
  @lives = 6
  ask_for_word
  game_loop
  end

  def ask_for_word
  mystery_word = $file_data.sample
  @new_word= Word.new(mystery_word)
  # grab a mystery word from txt file and and save it to an instance variable 
  end

  def game_loop
    # Run the game loop until the player wins or loses, with the option to play again
    loop do
      # show the current output of the word
      @new_word.output_word
      # inform the user how many lives they have left
puts "you have #{@lives} lives left"
puts "Guess a letter or -"
@letter =  gets.chomp
$guessed_letters.push @letter
puts "letters you have guessed so far: #{$guessed_letters.join}"
@result = @new_word.guess?(@letter)

@result?nil:@lives = @lives-1
if(@lives == 0)
 @new_word.solution
 puts "play again yes/no?"
 @answer = gets.chomp
 if(@answer == 'yes'|| @answer == 'y')
  $guessed_letters.clear
   MysteryWordGame.new
 end
  break
end

if(@new_word.guessed_all_correct?)
'you win!'
puts "play again? yes/no"
@answer = gets.chomp
if(@answer == 'yes')
  MysteryWordGame.new
end
break
end
    end
  end
end

MysteryWordGame.new
