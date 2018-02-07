module Players
  class Computer < Player

    def random_num
      position = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
    end

      def move(board)
        move = ""

        puts "Computer is making a move..."

        if board.turn_count == 0 || board.turn_count == 1
          move = "5"

      #   #go to a corner for the first 2 turns
        elsif board.turn_count == 2
          win = [0, 2, 7, 8].find { |x| board.cells[x] != " " }


      #   else #after this it needs to check the win combos!
      #      Game::WIN_COMBINATIONS.find do |combo|
      # #       #If 2 are taken in a win combo for other player, then occupy that space
      #        if combo.collect { |i| board.cells[i] == token}.count == 2 && combo.any?{|i| board.cells[i] == " "}
      #          move = [0,1,2].detect {|i| board.cells[i] != " "} #something is going wrong here!

        else
           n = random_num #pick a random number
           if board.valid_move?(n) #check that it is a valid move (position)
           n #return the valid position
         end
       end


     end
  end
end
