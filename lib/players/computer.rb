require 'pry'

module Players
  class Computer < Player
    #arrays and arrays and arrays #puremasochism

    # 1|2|3   0|1|2
    # 4|5|6 > 3|4|5
    # 7|8|9   6|7|8

    WIN_COMBINATIONS = [
      #horizontal win
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      #verticle win
      [0, 3, 6],
      [2, 5, 8],
      [1, 4, 7],
      #diagonal win
      [0, 4, 8],
      [2, 4, 6]
    ].freeze

    attr_accessor :cells, :board, :state, :turn_count

    def move(board)
      self.cells = board.cells
      self.board = board
      self.state = board_state
      self.turn_count = board.turn_count

      token == 'X' ? x_move : o_move
    end
    #we'll iterate over the board (cells) checking board_state vs WIN_COMBINATIONS and having the computer 'choose' accordingly

    #created a method to return current state of the board
    def board_state
      WIN_COMBINATIONS.collect do |combo|
        #examine as a hash (e = empty)
        c_state = {X: 0, O: 0, e: 0}
        combo.each do |i|
          case cells[i]
          when 'X'
            c_state[:X] += 1
          when 'O'
            c_state[:O] += 1
          when " "
            c_state[:e] += 1
          end
        end
        c_state
      end
    end

    #default first move and/or center is open
    def move_center_or_corner
      cells[4] != 'X' ? '5' : %w[1 3 7 9].sample
    end

    # #check_board_state, along with helper methods, will return a hash with
    # the current board state for comparing/iterating over
    def check_board_state(x, o, e)
      to_check = {X: x, O: o, e: e}
      move = state.each_with_index.find do |i, _index|
        i == to_check
      end
      int_to_string(move) if move
    end

    #takes the index of the move, adds one, converts to string
    def int_to_string(move)
      i = WIN_COMBINATIONS[move[1]].find {|i| cells[i] == " "}
      int_to_move(i)
    end

    #another helper method, int_to_move
    def int_to_move(i)
      (i + 1).to_s
    end

    #random corner method
    def rand_corner
      i = [0, 2, 6, 8].find_all {|e| cells[e] == " "}.sample
      int_to_move(i) if i
    end

    # #x_move & #o_move to define how the computer moves with #move
    def x_move
      return move_center_or_corner if turn_count == 0
      return rand_corner if turn_count == 2

      #check with board_state for winning moves or opponent's winning move, respectively
      move = check_board_state(0, 2, 1)
      return move if move

      move = check_board_state(2, 0, 1)
      return move if move

      random

    end

    def o_move
      return move_center_or_corner if turn_count == 1

      #check with board_state for winning moves or opponent's winning move, respectively
      move = check_board_state(0, 2, 1)
      return move if move

      move = check_board_state(2, 0, 1)
      return move if move

      move = rand_corner
      return move if move

      random

    end

    #fallback random move
    def random
      %w[1 2 3 4 5 6 7 8 9].reject {|e| board.taken?(e)}.sample
    end

  end
end
