module Players
  
  class Computer < Player 
    attr_accessor :board
    CORNERS = [0, 2, 8, 6]
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
    case 
      when to_win? != nil
        puts "to_win?"
        input = to_win? + 1 
      when to_block? != nil 
        puts "to block"
        input = to_block? + 1 
      when take_center?
        puts "take center"
        input = 5 
      when defend_corner != nil
        puts "defend_corner"
        input = defend_corner
      when take_corner?
        puts "take corner"
        input = take_corner? + 1
      else
        #binding.pry
        puts "random"
        input = rand(9)
    end
  end  
    
  def opponent
    token == "X" ? "O" : "X"
  end
    
  def to_win?
    winning_row = WIN_COMBINATIONS.find do |combo|
      board[combo[0]] == token && board[combo[1]] == token && board[combo[2]] == " " || board[combo[2]] == token && board[combo[1]] == token && board[combo[0]] == " " || board[combo[0]] == token && board[combo[2]] == token && board[combo[1]] == " "
    end
    if winning_row != nil
      winning_cell = winning_row.find {|cell| board[cell] == " "}
    end
  end
    
  def to_block? 
    blocking = WIN_COMBINATIONS.find do |combo|
      board[combo[0]] == opponent && board[combo[1]] == opponent && board[combo[2]] == " " || board[combo[2]] == opponent && board[combo[1]] == opponent && board[combo[0]] == " " || board[combo[0]] == opponent && board[combo[2]] == opponent && board[combo[1]] == " "
    end
    if blocking != nil
      the_block = blocking.find {|cell| board[cell] == " "}
    end
  end
    
  def take_center?
    board[4] == " "
  end
  
  def corners
    CORNERS.shuffle!
  end
    
  def take_corner?
    corners.find {|corner| board[corner] == " "}
  end
  
  def defend_corner
    if board[0] != " " && board[8] == " " 
      9
    elsif board[8] != " " && board[0] == " " 
        1
      elsif board[2] != " " && board[6] == " "
          7
        elsif board[6] != " " && board[2] == " " 
          3
        else
          nil
    end
  end
  
end 
end

