require "pry"

module Players

    class Computer < Player

      def move(board)
        opponent_token="X"
        opponent_token="O" if self.token=="X"

        array=[]
        array_priority=[]
        array_corners=[]

        Game::WIN_COMBINATIONS.each do |win_option|
          match_check=board.cells.values_at(win_option[0],win_option[1],win_option[2])
          array_priority << "#{win_option.find_index(" ")}" if match_check.count(opponent_token)==2 && win_option.include?(" ")
        end

        board.cells.each_with_index {|position, index| array << "#{index+1}" if position == " " }
        array.each{|position| array_corners << position if position=="1" || position=="3" || position=="7" || position=="9"}

          if array.include?("5")
            "5"
          elsif !array_priority.empty?
            array_priority.sample
          elsif !array_corners.empty?
            array_corners.sample
          else
            array.sample
          end
      end

    end

end
