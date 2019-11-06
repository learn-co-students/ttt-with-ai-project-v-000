require 'pry'
module Players
  class Computer < Player
    attr_accessor :board, :opponent

    def opponent
      if self.token == "X"
        "O"
      elsif self.token == "O"
        "X"
      end
    end
    ### SHOULD BREAK UP #MOVE INTO SMALLER METHODS WITH A SINGLE FUNCTIONALITY
  #  def close?(board)
  #    p = board.cells
  #    position = ""

  #    @@win_combos.each do |combo|
  #      combo.detect do |i|
  #        if combo.count{|i| p[i] == "X"} == 2 && combo.count{|i| p[i] == " "} == 1
  #          position = "9"
  #          puts "See ya Space Cowboy"
  #        elsif combo.count {|i| p[i] == "O"} == 2 && combo.count{|i| p[i] == " "} == 1
  #          position ="9"
  #          puts "See ya Space Cowboy"
  #        end
  #      end
  #    end
  #  end

    def move(board)
      p = board.cells
      @position = nil
  #    (1 + rand(9)).to_s
      sleep(0.5)
      ### Check if comp has 1 of 3 filled in a combination
      Game::WIN_COMBINATIONS.detect do |combo|

        if (combo.count{|i| p[i] == self.token} == 1 && combo.count{|i|p[i] == " "} == 2)
          @position = combo.shuffle.detect{|el| !board.taken?(el+1)} + 1

        end
      end

      ### Check if either player has 2 of 3 in a combination
      Game::WIN_COMBINATIONS.detect do |combo|

        if (combo.count{|i| p[i] == self.token} == 2 &&combo.count{|i| p[i] == " "} == 1)
          @position = combo.detect{|el| !board.taken?(el+1)} + 1
        elsif
           (combo.count {|i| p[i] == self.opponent} == 2 && combo.count{|i| p[i] == " "} == 1)

          @position = combo.detect{|el| !board.taken?(el+1)} + 1
        end
      end

      ### Check if any corners or middle are available
      if @position == nil && [1,3,5,7,9].any?{|i| board.valid_move?(i)}
        ### If second player, take middle tile if available
        if self.token == "O" && board.valid_move?(5)
          "5"
        else
          [1,3,5,7,9].shuffle.detect{|i| board.valid_move?(i)}.to_s
        end
        ### Take any available prime tile
      elsif @position == nil && [1,3,5,7,9].none?{|i| board.valid_move?(i)}
        (1..9).detect{|i| board.valid_move?(i)}.to_s
      else
        ### Take highest valued position
        @position.to_s
      end

    end
  end
end
