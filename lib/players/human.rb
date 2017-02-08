module Players
  class Human < Player

    def move(board)
      puts ""
      puts "Player #{@token}, make your move! [1-9]"
      # ARGV.clear
      # input = STDIN.gets.chomp
      input = gets.chomp
      input
    end


  end
end
