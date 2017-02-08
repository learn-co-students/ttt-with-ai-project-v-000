module Players
  class Human < Player

    def move(board)
      puts ""
      puts "Player #{@token}, make your move! [1-9]"
      input = gets.chomp
      input
    end


  end
end
