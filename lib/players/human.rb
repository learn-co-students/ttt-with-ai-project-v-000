require_relative '../player.rb'

module Players


  class Human < Player


    def move(array)
      puts "Where would you like to move? You can select position 1-9"
      user_play = gets
      user_play
    end

  end


end
