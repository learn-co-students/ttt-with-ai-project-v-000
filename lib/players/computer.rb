module Players
  require 'pry'

  class Computer < Player
  WIN_COMBINATIONS = [[0,1,2],[3,4,5,],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  def move(board)
    if board.turn_count < 4
      first_move(board) || corners(board) || random(board)
    elsif board.turn_count > 3
      almost_won(board)
    end
  end

  def first_move(board)
    input = "5" unless board.taken?(5)
  end

  def random(board)
    valid_moves =["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    input = valid_moves.sample
  end

  def corners(board)
    corner = ["1", "3", "7", "9"]
    input = corner.sample
    if board.valid_move?(input) == true
     input
    end
  end
  def almost_won(board)
    WIN_COMBINATIONS.each do |game1|
    win_1 = game1[0]
    win_2 = game1[1]
    win_3 = game1[2]
      if board.cells[win_1] == "#{self.token}" && board.cells[win_2] == "#{self.token}" && board.cells[win_3] == " "
        input = win_3 + 1
        input.to_s
      elsif
       board.cells[win_1] == "#{self.token}" && board.cells[win_2] == " " && board.cells[win_3] == "#{self.token}"
       input = win_2 + 1
        input.to_s
      elsif 
        board.cells[win_1] == " " && board.cells[win_2] == "#{self.token}" && board.cells[win_3] == "#{self.token}"
        input = win_1 + 1
        input.to_s
      else 
        random(board)
        binding.pry
     end
    end
  end 


 
end
end

