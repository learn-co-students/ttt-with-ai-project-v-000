module Players
  class Human < Player
    
    def move(board)
     puts "#{@token}, please enter a move (1-9):"
    input = gets.strip
    end
    
  def self.select_token
    puts "Do you want to be 'X' or 'O'?"
    selection = gets.strip
    case token
    when "X"
      puts "You are Player 'X'!"
      "X"
    when "x"
      puts "You are Player 'X'!"
      "X"
    when "O"
      puts "You are Player 'O'!"
      "O"
    when "o"
      puts "You are Player 'O'!"
      "O"
    else
      puts "Please select 'X' or 'O'..."
      select_token
    end
  end 
  end
end