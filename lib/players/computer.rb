require 'pry'

module Players
class Computer < Player
  
  
  def move(board)
    if board.cells[4] == " "
      "5"
    else 
    ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
    end 
  end 
  
  
  
  # WIN_COMBINATIONS = [
  # [0,1,2],
  # [3,4,5],
  # [6,7,8],
  # [0,3,6],
  # [1,4,7],
  # [2,5,8],
  # [0,4,8],
  # [2,4,6]
  # ]
    
    # def win(board)
    #   WIN_COMBINATIONS.detect do |combo|
    #     if board.cells[combo[0]] == board.cells[combo[1]] 
    #         combo[2].to_s
    #     elsif board.cells[combo[0]] == board.cells[combo[2]]
    #         combo[1].to_s
    #     elsif board.cells[combo[2]] == board.cells[combo[1]]
    #         combo[0].to_s
    #     end
    #   end
    # end 

    # def block 
    #   WIN_COMBINATIONS.detect do |combo|
    #     if board.cells[combo[0]] != token && board.cells[combo[0]] != " " &&  board.cells[combo[0]] == board.cells[combo[1]] 
    #         combo[2].to_s
    #     elsif board.cells[combo[0]] != token && board.cells[combo[0]] != " " && board.cells[combo[0]] == board.cells[combo[2]]
    #         combo[1].to_s
    #     elsif board.cells[combo[2]] != token && board.cells[combo[2]] != " " && board.cells[combo[2]] == board.cells[combo[1]]
    #         combo[0].to_s
    #     end
    #   end
    # end
    
    # def create_fork 
    #     if board.cells[0] == token && (board.cells[0] == board.cells[2] || board.cells[0] == board.cells[6])
    #       "4"
    #     elsif board.cells[8] == token && (board.cells[8] == board.cells[6] || board.cells[8] == board.cells[2])  
    #       "4"
    #     elsif board.cells[0] == token && board.cells[0] == board.cells[4] 
    #       ["2", "6"].sample
    #     elsif board.cells[8] == token && board.cells[8] == board.cells[4]  
    #       ["2", "6"].sample
    #     elsif board.cells[2] == token && board.cells[4] == board.cells[2]
    #       ["0", "8"].sample
    #     elsif board.cells[4] == token && board.cells[4] == board.cells[6]
    #       ["0", "8"].sample
    #   end
    # end
    
    # def defend_fork
    #     if (board.cells[0] != token || board.cells[0] != " ") && (board.cells[0] == board.cells[2] || board.cells[0] == board.cells[6])
    #       "4"
    #     elsif (board.cells[8] != token || board.cells[0] != " ") && (board.cells[8] == board.cells[6] || board.cells[8] == board.cells[2])  
    #       "4"
    #     elsif (board.cells[0] != token || board.cells[0] != " ") && board.cells[0] == board.cells[4] 
    #       ["2", "6"].sample
    #     elsif (board.cells[8] != token || board.cells[0] != " ") && board.cells[8] == board.cells[4]  
    #       ["2", "6"].sample
    #     elsif (board.cells[4] != token || board.cells[0] != " ") && board.cells[4] == board.cells[2]
    #       ["0", "8"].sample
    #     elsif (board.cells[4] != token || board.cells[0] != " ") && board.cells[4] == board.cells[6]
    #       ["0", "8"].sample
    #   end
    # end
  

end
end
