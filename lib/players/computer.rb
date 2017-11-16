require 'pry'

module Players
  class Computer < Player
    attr_accessor :move

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]]

    def move(board)
      puts ""
      puts "Computer's turn"
      puts ""
      to_move(minimax(board, self.token))
    end

    def minimax(board, current_p, depth = 0)
      return 0 if draw?(board)
      return -1 if game_won?(board)
      scores = {}

      possible_moves(board).each do |move|
        board.cells[move] = current_p
        scores[move] = -minimax(board, switch(current_p), depth + 1)
        board.cells[move] = " "
      end

      if depth == 0
        best_move = scores.max_by {|k,v|v}[0]
      else
        highest_score = scores.max_by{|k,v|v}[1]
      end
    end

    def game_won?(board)
      WIN_COMBINATIONS.detect do |comb|
        array = [board.cells[comb[0]], board.cells[comb[1]], board.cells[comb[2]]]
        array == ["X", "X", "X"] || array == ["O", "O", "O"]
      end
    end

    def draw?(board)
      board_full?(board) && !game_won?(board)
    end

    def board_full?(board)
      board.cells.detect {|i| i == " "} ? false : true
    end

    def possible_moves(board)
      board.cells.each_index.select do |c|
        board.cells[c] == " " ? true : false
      end
    end

    def switch(player)
      player == "X" ? "O" : "X"
    end

    def to_move(index)
      position = index + 1
      position.to_s
    end
  end
end
