require "pry"
module Players

  class Computer < Player
    
    attr_reader :token, :opponent_token 
   
    WIN_COUNTS = {0=>3, 1=>2, 2=>3, 3=>2, 4=>4, 5=>2, 6=>3, 7=>2, 8=>3}
   
    WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #mid row
    [6,7,8], #bot row
    [0,3,6], #left col
    [1,4,7], #mid col
    [2,5,8], #right col
    [0,4,8], #l>r diag
    [2,4,6]  #r>l diag
  ]

    def initialize(token)
      #determines if you play stupid computer (random sampling) or ai 
      @token = token 
      case 
        when token ==  "X"
          @opponent_token = "O"
        else
          @opponent_token = "X"
      end
    end
  
    # dumb computer (1)
    
    def random_move(board)
      # just choose something at random until you hit upon a valid move
      (1..9).to_a.sample.to_s
    end
    
    # begin smart computer (2) methods
    
    def index_to_move(index)
      (index + 1).to_s 
    end
    
    def create_cheat_sheet(board)
        WIN_COMBINATIONS.collect do |combo|
        combo.collect do |index|
          if board.cells[index] == " "
            index_to_move(index)
          else
            board.cells[index] 
          end 
        end 
      end 
    end 
    
    def create_updated_win_hash(board)
      Hash.new.tap do |new_hash|
        WIN_COUNTS.each do |k, v|
          if board.cells[k] == " "
            new_hash[k] = v 
          end
        end
      end
    end
    
    def choose_best_move(hash)
      max_moves = 0
      best_available = 0
      hash.each do |k,v|
        if v > max_moves
          max_moves = v
          best_available = k
        end 
      end 
      index_to_move(best_available)               
    end

  
    #determines if a win is imminent, i.e. there is a WIN_COMBINATION with two spaces taken by sef.token and an empty space (will be an integer on cheat_sheet)

    def win_imminent?(cheat_sheet)
      cheat_sheet.detect do |combo| 
        combo.count{|space| space == token} == 2 && !combo.include?(opponent_token)
      end
    end

    # uses cheat_sheet and determines if a block is necessary if a combo contains two opponent_tokens 
    
    def block?(cheat_sheet)
      cheat_sheet.detect do |combo| 
        combo.count{|space| space == opponent_token} == 2 && !combo.include?(token)
      end
    end
    
    def move(board)
     cheat_sheet = create_cheat_sheet(board)
      if win_imminent?(cheat_sheet)
          win_imminent?(cheat_sheet).detect{|x| x != token}
      elsif block?(cheat_sheet) 
          block?(cheat_sheet).detect{|x| x != opponent_token}
      else
          hash = create_updated_win_hash(board)
          choose_best_move(hash)
      end
    end
    
  end
  
end