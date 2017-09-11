
module Players
  class Computer < Player

    def initialize(token)
      super
    end

    def move(board)
      input = (rand * 10).floor
      board.valid_move?(input) ? input.to_s : move(board)
    end

    def to_win(board)
      Game::WIN_COMBINATIONS.collect do |combo|
        if combo.count{|e| board.position(e) == self.token}.eql?(2) && combo.count{|e| board.position(e) == " "}.eql?(1)
          combo
        elsif combo.count{|e| board.position(e) == "X"}.eql?(2) && combo.count{|e| board.position(e) == " "}.eql?(1)
  end  # End of Class
end  # End of Module

  # def offense(board)
  #   if combo.count{|e| board.position(e) == "X"}.eql?(2) && combo.count{|e| board.position(e) == " "}.eql?(1)
  #     combo

def other_token()
  ["X", "O", " "].detect{|t| t != self.token && t!= " "}
