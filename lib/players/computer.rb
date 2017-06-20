module Players
  class Computer < Player

    def initialize(token)
      super
      @opponent_token = token == "X" ? "O" : "X"
      @center = "5"
      @corners = ["1","3","7","9"]
      @sides = ["2","4","6","8"]
    end


    
    def can_win?(player_token, board)
      Game::WIN_COMBINATIONS.detect do |combo|
        combo.count{|i| board.cells[i] == player_token} == 2 &&
        combo.count{|i| board.cells[i] == " "} == 1
      end
    end

    def win(board)
      "#{can_win?(@token, board).detect{|i| board.cells[i] == " "} + 1}"
    end
    
    def block_opponent(board)
      "#{can_win?(@opponent_token, board).detect{|i| board.cells[i] == " "} + 1}"
    end
    


    def center_free?(board)
      board.taken?(@center) == false
    end



    def corners_occupied?(board)
      occupied = @corners.select do |c|
        board.taken?(c) &&
        board.cells[c.to_i - 1] == @opponent_token
      end
      occupied unless occupied.empty?
    end
    
    def opposing_corner_free?(board)
      corners_occupied?(board).detect do |corner|
        case corner
        when "1"
          true if board.taken?("9") == false
        when "3"
          true if board.taken?("7") == false
        when "7"
          true if board.taken?("3") == false
        when "9"
          true if board.taken?("1") == false
        end
      end
    end

    def take_opposing_corner(board)
      case opposing_corner_free?(board)
      when "1"
        "9"
      when "3"
        "7"
      when "7"
        "3"
      when "9"
        "1"
      end
      
    end
    


    def corner_free?(board)
      @corners.detect{|c| board.taken?(c) == false}
    end

    def take_corner(board)
      corner_free?(board)
    end
    

    def side_free?(board)
      @sides.detect{|c| board.taken?(c) == false}
    end
    
    def take_side(board)
      side_free?(board)
    end
    
    
    

    def move(board)
      if can_win?(@token, board)
        win(board)

      elsif can_win?(@opponent_token, board)
        block_opponent(board)

      elsif center_free?(board)
        @center

      elsif corners_occupied?(board) && opposing_corner_free?(board)
        take_opposing_corner(board)

      elsif corner_free?(board)
        take_corner(board)

      elsif side_free?(board)
        take_side(board)

      end

    end



  end
end