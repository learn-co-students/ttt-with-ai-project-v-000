
module Players
  class Computer < Player
  attr_accessor :moves

    def initialize(token)
      super
      @moves = []
    end

    NEXT_MOVES = [1, -1, 3, -3, 4, -4, 6, -6]

    def move(board)
      if board.turn_count < 4
        random_move(board)
      elsif board.turn_count > 8
        index = next_move(board) + self.moves.last
      else
        board.open_spaces.sample
      end
    end



    def next_move(board)
      NEXT_MOVES.find do |index|
        (0..8).include?(board.position(self.moves.last + index)) &&
          board.position(self.moves.last + index) == " "
      end
    end



    def to_win?(board)
      Game::WIN_COMBINATIONS.detect do |combo|
        if combo.select {|a| board.cells[a] == self.token}.count = 2
          combo
        elsif combo.select {|a| board.cells[a] == other}.count == 2
          combo
        else
          false
        end
      end
    end

    # def find_index(board)
    #   to_win? ? to_win?(board).detect{|a| board.cells[a] == " "} : false
    # end

    #   if !self.win_combo.nil?
    #     self.win_combo.find{|e| board.valid_move?(e+1)}
    #   elsif !self.block_combo.nil?
    #     self.block_combo.find{|e| board.valid_move?(e+1)}
    #   end
    # end



    def other
      self.token.eql?("X") ? "O" : "X"
    end

    def random_move(board)
      input = (rand * 10).floor
      if board.valid_move?(input)
        self.moves << input
        input.to_s
      end
    end


  end  # End of Class
end  # End of Module

  # def offense(board)
  #   if combo.count{|e| board.position(e) == "X"}.eql?(2) && combo.count{|e| board.position(e) == " "}.eql?(1)
  #     combo

  # def move(board)
  #   if board.turn_count < 4
  #     random_move(board)
  #   else f find_index(board)
  #     find_index(board)
  #   else
  #     midway(board)
  #   end
  # end
