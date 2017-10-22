equire "pry"
module Players
  class Computer < Player
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [2,4,6]
    ]
    def getMoveFromCombos(board,combos)
      if combos.empty?
        return findAnyAvailableMove(board)
      end
      moves = combos.flatten!
      moves.each do |move|
        if(board.cells[move] == token)
          combos.delete(move)
        end
      end

      best_move = 0
      possibilities = 0
      moves.each do |move|
        count = WIN_COMBINATIONS.flatten.find_all{|cell| cell == move}.size
        if count > possibilities
          possibilities = count
          best_move = move
        end
      end
      return (best_move+1).to_s
    end
    def findAnyAvailableMove(board)
      board.cells.each_with_index do |cell,index|
        if cell == " "
          return (index+1).to_s
        end
      end
      return "error"
    end
    def findBestMove(board)
      # xxo
      # oox
      # x--
      combos = findCombos(board) # returns all combos that
      getMoveFromCombos(board, combos)
    end
    def initialize(token)
      if(token == "X")
        @opponent = "O"
      else
        @opponent = "X"
      end
      super(token)
    end
    def isPlayerGoingToWin?(board, token)
      WIN_COMBINATIONS.each do |combo|
        if(board.cells[combo[0]] == token && board.cells[combo[1]] == token && board.cells[combo[2]] == " ")
          return (combo[2]+1).to_s
        elsif (board.cells[combo[0]] == token && board.cells[combo[2]] == token && board.cells[combo[1]] == " ")
          return (combo[1]+1).to_s
        elsif (board.cells[combo[1]] == token && board.cells[combo[2]] == token && board.cells[combo[0]] == " ")
          return (combo[0]+1).to_s
        end
      end
      return nil
    end

    def findCombos(board, token = self.token)
      possible_combos = []
      winnable_combos = []
      for x in 0..8
        if(board.cells[x] == token)
          possible_combos << WIN_COMBINATIONS.find_all{|combo| combo.include?(x)}
        end
      end
      possible_combos.each do |combos|
        combos.each do |combo|
          if(board.cells[combo[0]] != @opponent && board.cells[combo[1]] != @opponent && board.cells[combo[2]] != @opponent)
            winnable_combos << combo
          end
        end
      end
      winnable_combos = winnable_combos.uniq
      return winnable_combos
    end
    def firstMove?(board)
      if board.turn_count == 0 || board.turn_count == 1
        return getMoveFromCombos(board, findCombos(board," "))
      end
      return nil
    end
    def whatsMyBestMove?(board)
      move_to = firstMove?(board)
      if(!move_to.nil?)
        return move_to
      end
      
      move_to = isPlayerGoingToWin?(board, token)
      if(!move_to.nil?)
        return move_to
      end

      move_to = isPlayerGoingToWin?(board, @opponent)
      if(!move_to.nil?)
        return move_to
      end

      move_to = findBestMove(board)
    end
    def move(board)
      self.whatsMyBestMove?(board)
    end
  end
end
