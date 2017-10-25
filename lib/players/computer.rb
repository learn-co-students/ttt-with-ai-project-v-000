require 'pry'

module Players
  class Computer < Player
    attr_reader :board

    #board is instance
    def move(board)
      @board = board
      #binding.pry
      computer_move = empty?.first.to_s
    end

    def empty?
      empty_cells = []
      board.cells.each.with_index(1) do |element, i|
        if element == " "
          empty_cells << i
        end
      end
      empty_cells
    end

    #incorporate minimax into ai, still needs some work
    def minimax(board, current_player_instance)
      return score(board) if over? #need to build this function or figure out how to use game method
      @@scores ||= {} #collect scores for each position
      # For each available space on the board, loop through and apply min-max recursively
      empty?.each do |space|
        # Copy board so we don't mess up original (IMPORTANT)
        potential_board = board.dup
        # Move the current player to the space on the duplicate board
        potential_board.update(space, current_player_instance)
        # Recurse until the game is over
        # Switch players each time to mimic the rules of Tic-Tac-Toe
        scores[space] = minmax(potential_board, switch(current_player))#need to create switch
      end


    end

  end
end
