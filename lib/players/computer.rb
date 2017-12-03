
module Players
  class Computer < Player

    def move(board)
      rand(0...8).to_s
    end

  end
end


# rspec spec/03_human_player_spec.rb
