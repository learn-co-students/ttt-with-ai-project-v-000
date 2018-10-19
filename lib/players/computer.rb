
module Players
  class Computer < Player
    
    WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    def move(board) 
      input = rand(1..9)
      
      if board.turn_count == 0 
        input = center_move
        
      elsif board.turn_count == 1 && center(board) == " "
        input = center_move
        
      elsif board.turn_count == 1 && center(board) != " "
        input = open_corner(board)
        
      elsif board.turn_count == 2
        input = opposite_corner(board) || open_corner(board)  
      
      elsif board.turn_count == 6
        input = go_for_win(board) || counter_attack(board) || open_edge?(board)
        
      else 
        input = go_for_win(board) || counter_attack(board) || open_corner(board) || rand(1..9)
      end 
      input 
    end
    
    def center(board)
      board.cells[4]
    end
      
    def center_move
      "5"
    end 
    
    def open_corner(board)
      if board.cells[0] == " "
        "1"
      elsif board.cells[2] == " " 
        "3"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[8] == " "
        "9"
      else 
        nil 
      end 
    end 
  
    def opposite_corner(board)
      if board.cells[0] != " "
        "9"
      elsif board.cells[2] != " "
        "7"
      elsif board.cells[6] != " "
        "3"
      elsif board.cells[8] != " "
        "1"
      else 
        nil 
      end 
    end 
  
    def almost_winner_x(board)
      WIN_COMBINATIONS.detect do |win_combo|
            (board.cells[win_combo[0]] == "X" && board.cells[win_combo[1]] == "X" && board.cells[win_combo[2]] == " ") || (board.cells[win_combo[0]] == " " && board.cells[win_combo[1]] == "X" && board.cells[win_combo[2]] == "X") || (board.cells[win_combo[0]] == "X" && board.cells[win_combo[1]] == " " && board.cells[win_combo[2]] == "X")
      end 
    end
  
    def almost_winner_o(board)
      WIN_COMBINATIONS.detect do |win_combo|
            (board.cells[win_combo[0]] == "O" && board.cells[win_combo[1]] == "O" && board.cells[win_combo[2]] == " ") || (board.cells[win_combo[0]] == " " && board.cells[win_combo[1]] == "O" && board.cells[win_combo[2]] == "O") || (board.cells[win_combo[0]] == "O" && board.cells[win_combo[1]] == " " && board.cells[win_combo[2]] == "O")
      end 
    end
  
    def almost_winner(board)
      if almost_winner_x(board).is_a?(Array)
        almost_winner_x(board)
      elsif almost_winner_o(board).is_a?(Array)
        almost_winner_o(board)
      else 
        nil
      end 
    end 
  
    def counter(board)
      if almost_winner(board) == nil
        nil
      else 
        almost_winner(board).detect do |spot|
          board.cells[spot] == " "
        end 
      end 
    end 
    
    def counter_attack(board)
      if counter(board) != nil
        (counter(board) + 1).to_s
      elsif counter(board) == nil  
        nil 
      end 
    end 
    
    def win?(board)
      if almost_winner_x(board).is_a?(Array) && token == "X"
        almost_winner_x(board).detect do |spot|
          board.cells[spot] == " "
        end 
      elsif almost_winner_o(board).is_a?(Array) && token == "O"
        almost_winner_o(board).detect do |spot|
          board.cells[spot] == " "
        end 
      else 
        nil 
      end
    end 
    
    def go_for_win(board) 
      if win?(board).is_a?(Integer)
        (win?(board) + 1).to_s
      elsif win?(board) == nil 
        nil
      end 
    end 
    
    def open_edge?(board)
      if board.cells[1] == " "
        "2"
      elsif board.cells[3] == " "
        "4"
      elsif board.cells[5] == " "
        "6"
      elsif board.cells[7] == " "
        "8"
      else 
        nil
      end 
    end 
    
  end 
end 