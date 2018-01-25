module Players
  class Computer < Player

  attr_accessor :my_last, :center_play
  attr_reader :token

  def initialize(token)
    super
    @my_last = nil
    @center_play = false
  end

def play_defense
  if opponent_has_2?
    opponent_has_2?
  else
    available = []
    @board.cells.each_with_index do |cell, i|
      available << (i+1).to_s if cell == " "
    end
      binding.pry
    available.sample
  end
end

  def move(board)
    if @token == "X"
      puts "Computer X, block position: #{opponent_has_2?}"
        #////////////// CENTER CASE //////////////
      @center_play = true
      if @center_play
        if @board.turn_count == 0
          @my_last = "5"
        elsif @board.turn_count == 2
          binding.pry
            if @board.last_move.to_i.even? #if opponent plays 2, 4, 6, 8 => EDGE: OFFENSE MODE
              if @board.last_move == "2" || @board.last_move == "8"
                @my_last = "1" # REFACTOR: CAN ALSO BE 4, 7, 3,6,9
              elsif @board.last_move == "4" || @board.last_move == "6"
                @my_last = "3" # REFACTOR: CAN ALSO BE 1,2, 7,8,9
              end
            else #opponent plays corner: DEFENSE MODE
              play_defense
            end

          elsif @board.turn_count == 4
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

            elsif @my_last == "8"
              @my_last == "1"
            end

          elsif @board.turn_count == 6
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
        end
      end #//center_play end
    end #// first_play end
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
