require_relative "../player.rb"
module Players
  class Computer < Player
    attr_accessor :board
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
    def move(board)
      @board = board
      move = self.smart_choices.to_s
    end

    def smart_choices
      turn = self.board.turn_count
      case turn
      when 0
          5
      when 1
        if self.board.cells[4] == " "
          5
        else
          corners = [1,3,7,9]
          index = rand(0..3)
          corners[index]
        end
      when 2
        corners = [1,3,7,9].select { |index| self.board.cells[index] == " "}
        index = rand(0..2)
        corners[index]
      else
        # rand(1..9)
        if self.token == "X"
          self.combination_check_x
        elsif self.token == "O"
          self.combination_check_o
        end
      end
    end

    def combination_check_x
      move = WIN_COMBINATIONS.find do |win_array|
        (win_array.select {|index| self.board.cells[index] == "O" }.count == 2) && (win_array.select{|index| self.board.cells[index] == " "}.count == 1)
      end
      if move  == nil
          rand(1..9)
      else
        index = move.find{|item| self.board.cells[item] == " "}
        index +=1
        index
      end
    end

    def combination_check_o
      move = WIN_COMBINATIONS.find do |win_array|
        (win_array.select {|index| self.board.cells[index] == "X" }.count == 2) && (win_array.select{|index| self.board.cells[index] == " "}.count == 1)
      end
      if move == nil
          rand(1..9)
      else
        index = move.find{|item| self.board.cells[item] == " "}
        index +=1
        index
      end
    end

  end

end
