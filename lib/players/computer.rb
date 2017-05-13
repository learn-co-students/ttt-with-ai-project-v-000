module Players

  class Computer < Player

    def move(board)
      @board = board
      possible_moves = (1..9).to_a

      #taunt   ##figure out later (can't define class within this module)

      ##STRATEGIC MOVES##
      if combo_moves(board) != nil && board.turn_count > 1
        combo = combo_moves(board)
        move = combo.detect{ |i| board.cells[i] == " "}.next.to_s
      elsif !board.taken?(5)
        move = "5"
      elsif board.turn_count > 1 && board.turn_count == nil
        move = [1, 3, 7, 9].detect{ |i| !board.taken?(i) }.to_s
      else
        move = possible_moves.detect{ |i| !board.taken?(i) }.to_s
      end
      move
    end

    ###cycle over winning combos to either take or block###  issue when I go first to 9, then 3
   def combo_moves(board)
     Game::WIN_COMBINATIONS.detect do |combo|
       (@board.cells[combo[0]] == @board.cells[combo[1]] && @board.cells[combo[2]] == " ") ||
       (@board.cells[combo[0]] == @board.cells[combo[2]] && @board.cells[combo[1]] == " ") ||
       (@board.cells[combo[2]] == @board.cells[combo[1]] && @board.cells[combo[0]] == " ")
     end
   end

  # To be figured out later--can't identify class within this module. Consider using is_a?/kind_of?
  #  def taunt
  #    computer_sayings = ["Let me think about this...", "You can't rush genius.", "That was a big mistake, my friend."]
  #    if @player_1.class == Players::Human || @player_2.class === Players::Human
  #      puts "Computer says:"
  #      puts "#{computer_sayings.sample}"
  #      sleep(1)
  #    end
  #  end
  end
end
