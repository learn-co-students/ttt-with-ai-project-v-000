module Players
  class Human < Player

    def move(board)
      puts "Please make your move!"
      # ARGV.clear
      # input = STDIN.gets.chomp
      input = gets.chomp
      input
    end 
      

  end
end
