module Players
  class Human < Player
  
    def move(board)
      puts "What is your move? (1-9)"
      player_move=gets.chomp.to_i
    binding.pry
    end
  
  
  end
end