module Players
  class Computer < Player
    
    def move(board)
      
      computer_choice = self.possible_moves(board.turn_count, board)
      
      puts "Computer chooses space #{computer_choice.to_i}!\n\n"
      
      computer_choice
    end
    
    def possible_moves(turns_taken, board)
      if turns_taken < 3 
        self.choose_middle(board)  || self.choose_corner(board)  ||
        self.next_available_space(board)
        
      elsif turns_taken == 3 
        self.block_opponent(board) || self.choose_middle(board)  || 
        self.choose_corner(board)  || self.next_available_space(board)
        
      else # turns_taken > 3
        self.winning_move(board)   || self.block_opponent(board) || 
        self.choose_middle(board)  || self.choose_corner(board)  || 
        self.next_available_space(board)
      end
    end
    
    def winning_move(board)
      ("1".."9").detect do |choice|
        if !board.taken?(choice)
          case choice 
          when "1"
            choice if self.my_token?(board, ["2", "3"]) || 
            self.my_token?(board, ["4", "7"]) || self.my_token?(board, ["5", "9"])
          when "2"
            choice if self.my_token?(board, ["1", "3"]) ||
            self.my_token?(board, ["5", "8"])
          when "3"
            choice if self.my_token?(board, ["1", "2"]) || 
            self.my_token?(board, ["5", "7"]) || self.my_token?(board, ["6", "9"])
          when "4"
            choice if self.my_token?(board, ["1", "7"]) || 
            self.my_token?(board, ["5", "6"])
          when "5" 
            choice if self.my_token?(board, ["1", "9"]) || 
            self.my_token?(board, ["2", "8"]) || self.my_token?(board, ["3", "7"]) || 
            self.my_token?(board, ["4", "6"])
          when "6"
            choice if self.my_token?(board, ["4", "5"]) || 
            self.my_token?(board, ["3", "9"])
          when "7"
            choice if self.my_token?(board, ["1", "4"]) || 
            self.my_token?(board, ["3", "5"]) || self.my_token?(board, ["8", "9"])
          when "8"
            choice if self.my_token?(board, ["2", "5"]) || 
            self.my_token?(board, ["7", "9"])
          else # "9"
            choice if self.my_token?(board, ["1", "5"]) || 
            self.my_token?(board, ["3", "6"]) || self.my_token?(board, ["7", "8"])
          end
        end
      end
    end
    
    def block_opponent(board)
      ("1".."9").detect do |choice|
        if !board.taken?(choice)
          case choice 
          when "1"
            choice if self.opponents_token?(board, ["2", "3"]) || 
            self.opponents_token?(board, ["4", "7"]) || 
            self.opponents_token?(board, ["5", "9"])
          when "2"
            choice if self.opponents_token?(board, ["1", "3"]) || 
            self.opponents_token?(board, ["5", "8"])
          when "3"
            choice if self.opponents_token?(board, ["1", "2"]) || 
            self.opponents_token?(board, ["5", "7"]) || 
            self.opponents_token?(board, ["6", "9"])
          when "4"
            choice if self.opponents_token?(board, ["1", "7"]) || 
            self.opponents_token?(board, ["5", "6"])
          when "5"
            choice if self.opponents_token?(board, ["1", "9"]) || 
            self.opponents_token?(board, ["2", "8"]) || 
            self.opponents_token?(board, ["3", "7"]) || 
            self.opponents_token?(board, ["4", "6"])
          when "6"
            choice if self.opponents_token?(board, ["4", "5"]) || 
            self.opponents_token?(board, ["3", "9"])
          when "7"
            choice if self.opponents_token?(board, ["1", "4"]) || 
            self.opponents_token?(board, ["3", "5"]) || 
            self.opponents_token?(board, ["8", "9"])
          when "8"
            choice if self.opponents_token?(board, ["2", "5"]) || 
            self.opponents_token?(board, ["7", "9"])
          else # "9"
            choice if self.opponents_token?(board, ["1", "5"]) || 
            self.opponents_token?(board, ["3", "6"]) || 
            self.opponents_token?(board, ["7", "8"])
          end
        end
      end
    end
    
    def choose_middle(board)
      "5" if !board.taken?("5")
    end
    
    def choose_corner(board)
      ["1", "3", "7", "9"].detect {|corner| !board.taken?(corner)}
    end 
    
    def next_available_space(board) 
      # By now, the middle and corners are taken. 
      # "2", "4", "6", and "8" are the remaining available spaces.
      
      ["2", "4", "6", "8"].detect {|space| !board.taken?(space)}
    end
    
    def my_token?(board, spaces)
      spaces.all?{|space| board.position(space) == self.token}
    end 
    
    def opponents_token?(board, spaces)
      spaces.all?{|space| board.taken?(space) && board.position(space) != self.token}
    end
  end 
end
