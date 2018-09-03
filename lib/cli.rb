class Call
  
  def initialize 
  end 
  
  def start
    computer_1 = Players::Computer.new("X")
    computer_2 = Players::Computer.new("O")
    human_1 = Players::Human.new("X")
    human_2 = Players::Human.new("O")
    puts "Welcome to Tic Tac Toe!"
    puts "Would you like to play with 0, 1 or 2 players?"
    input = gets.chomp
    if input == "0" 
      Game.new(computer_1, computer_2).play
    elsif input == "1" 
      puts "Who would like to go first and be X; Human or Computer?"
      input = gets.chomp
        if input == "human" || input == "Human" || input == "HUMAN"
          Game.new(human_1, computer_2).play
        elsif input == "Computer" || input == "computer" || input == "COMPUTER"
          Game.new(computer_1, human_2).play
        else
            puts "Invalid entry.  Please try again."
        end
    elsif input == "2"
      Game.new.play
    else
      puts "Invalid entry.  Please try again."
      start
    end
    replay?
end

    def replay?
      puts "Would you like to play again?"
      input = gets.chomp
      if input == "Yes" || input == "Y" || input == "yes" || input == "y" || input == "YES"
        start
      elsif input == "No" || input == "NO" || input == "No" || input == "N" || input == "n"
        exit 
      else
        puts "Invalid entry.  Please try again."
      replay?
        end
    end
end

