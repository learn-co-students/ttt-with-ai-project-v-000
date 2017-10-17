class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end

end

module Players
  class Human < Player
    def move(board, current_player) # current_player avoids 'wrong number of arguments'...needed for #almost_won? below, probably bad
      puts "Please enter a position 1-9"
      gets.strip
      
    end
  end

  class Computer < Player
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    def find_opponent(current_player)
      current_player.token == "X" ? "O" : "X"
    end

    def need_to_block?(board, current_player)
      opponent = find_opponent(current_player) # defines opposing symbol
      empty_spot = nil # sets up state/default return
      double_row = WIN_COMBINATIONS.find do |combination|
        [board.cells[combination[0]],board.cells[combination[1]],board.cells[combination[2]]].sort  == [opponent,opponent," "].sort
      end
      if double_row != nil 
        empty_spot = double_row.find {|i| board.cells[i] == " "} + 1 # the '+1' makes board.taken? work, should probably simplify        
      end
      empty_spot
    end

    def move(board, current_player)
      if need_to_block?(board, current_player) != nil
        need_to_block?(board, current_player)
      elsif board.valid_move?("5")
          "5"
      elsif board.valid_move?("1") || board.valid_move?("3") || board.valid_move?("7") || board.valid_move?("9")    
        number = ["1","3","7","9"].sample until board.valid_move?(number)
        number
      elsif board.valid_move?("2") || board.valid_move?("4") || board.valid_move?("6") || board.valid_move?("8")
        number = ["2","4","6","8"].sample until board.valid_move?(number)
        number
      end
    end
  end
  

end

