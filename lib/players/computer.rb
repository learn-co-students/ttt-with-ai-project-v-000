require 'pry'
module Players
  class Computer < Player

  attr_accessor :my_last, :center_play, :defense_mode
  attr_reader :token

  def initialize(token)
    super
    @my_last = nil
    @defense_mode = false
  end

  def opponent_token
    token == "X" ? "O" : "X"
  end

  def random_position
    available = []
    @board.cells.each_with_index do |cell, i|
      available << (i+1).to_s if cell == " "
    end
    available.sample
  end

  def play_defense
    # if the opponent has 2 out of a win _combo, return the poisition to block
    # else return a random position out of all the positions available
    position_to_block = nil
    opponent_positions_taken = []

     WIN_COMBINATIONS_PLAYER.each do |combo|
       possible_win_combo = []
       combo.each do |position|
         if opponent_positions_taken.include?(position)
           possible_win_combo << position
         end
       end
       if possible_win_combo.count == 2
         position_to_block = (combo - possible_win_combo).first.to_s
       end
     end
     position_to_block ? position_to_block : random_position
  end


  def move
    if @token == "X"

        #////////////// CENTER CASE //////////////
      if !@defense_mode
      # START: OFFENSE MODE
        if @board.turn_count == 0
          @my_last = "5"
        elsif board.turn_count == 2
            if @board.last_move.to_i.even? #if opponent plays 2, 4, 6, 8 => EDGE: OFFENSE MODE
              if @board.last_move == "2" || @board.last_move == "8"
                @my_last = "1" # REFACTOR: CAN ALSO BE 4, 7, 3,6,9
              elsif @board.last_move == "4" || @board.last_move == "6"
                @my_last = "3" # REFACTOR: CAN ALSO BE 1,2, 7,8,9
              end
            else
              @defense_mode = true
              play_defense
            end
        elsif board.turn_count == 4
          if @my_last == "1"
            if @board.last_move == "9"
              @my_last = "7"
            else
              @my_last = "9" # WON!
            end
          elsif @my_last == "3"
            if @board.last_move == "7"
              @my_last = "1"
            else
              @my_last = "7" # WON!
            end
          end
        elsif board.turn_count == 6
          if @my_last == "7"
            if @board.last_move == "3"
              @my_last = "4"
            else
              @my_last = "3"
            end
          elsif @my_last == "1"
            if @board.last_move == "2"
              @my_last = "7"
            else
              @my_last = "2"
            end
          end
        end
        #// END OFFENSE MODE
      else
        play_defense
      end #end if !defense_mode
    else # PLAY SECOND
      if  @board.turn_count == 1
        if @board.last_move == "5"
          @my_last = ["1", "3", "7", "9"].sample
        elsif ["1", "3", "7", "9"].include?(@board.last_move)
          @my_last = "5"
        elsif @board.last_move == "2"#edge case 1: 2
          @my_last = ["1", "3", "5","8"].sample
        elsif @board.last_move == "4"
          @my_last = ["1","5","6", "7"].sample
        elsif @board.last_move == "6"
          @my_last = ["3","4","5","9"].sample
        end
      else # turn_count >=3
        play_defense
      end
    end
  end # END DEF MOVE
end
end


#////////////// EDGE CASE IN TOKEN = X //////////////
        # if board.turn_count == 0
        #    @my_last = "4"
        #
        # elsif board.turn_count == 2 && @my_last == "4"
        #   if board.last_move == "2" || board.last_move == "3"
        #     @my_last = "1"
        #   elsif board.last_move == "8" || board.last_move == "9"
        #     @my_last = "7"
        #   end
        #
        # elsif board.turn_count == 4
        #   if board.last_move == "7"
        #     @my_last = "5"
        #   end
        #
        # elsif board.turn_count == 6
        #   if board.last_move == "6"
        #     @my_last = "9"
        #   else
        #     @my_last = "6"
        #   end
        # end
