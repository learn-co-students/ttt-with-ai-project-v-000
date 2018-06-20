class TicTacToe
  
  def initialize
  call
  end

  def call
    puts "Hi!!Welcome to Tic Tac Toe!"
     puts "What kind of Tic Tac Toe game would you want to play?"
    puts " Enter 0 for a computer vs computer game"
    puts " Enter 1 for a human vs computer game"
    puts " Enter 2 for a human vs human game"
    puts " Type 'exit' to quit playing"
    input = gets.chomp
    if input.to_i == 0
      Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O")).play
    
    
    elsif input.to_i == 2
      Game.new.play
      
    else
      puts "Cool, which token do you want to be, X or O?"
      first_player = gets.chomp
      if first_player == "X" || first_player == "x"
        Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O")).play
        
        
        
      else
        Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O")).play
        
        
      end
    end
  end
end