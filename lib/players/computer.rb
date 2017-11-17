require 'pry'

module Players
  class Computer < Player
    include Rules

    def move(board)
      puts ""
      puts "Computer's turn"
      puts ""
      to_move(minimax(board, self.token))
    end

    def minimax(board, current_p, depth = 0)
      return 0 if draw?(board)
      return -1 if won?(board)
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
