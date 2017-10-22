module Players
  class Computer < Player
    attr_accessor :opponent

    def initialize(token)
      super
      @opponent = switch(token)
    end

    def move(gameboard=nil)
      sleep 2
      puts table_talk.sample
      input = next_move(gameboard, token)
      move = (input + 1).to_s
    end

    def switch(piece)
      piece == 'X' ? 'O' : 'X'
    end

    def pos_values(gameboard, token)
    	rv = [3,1,3,1,5,1,3,1,3]
    	gameboard.cells.each_with_index do |v, i|
    	  rv[i] += 5 if v == ' '
    	  rv[i] += -100 if v != token && v != ' '
    	end
    	rv
    end

    def win(gameboard, token, point_adj)
      rv = [0,0,0,0,0,0,0,0,0]
      Game::WIN_COMBINATIONS.each do |arr|
    	  z = arr.map{|i| gameboard.cells[i]}

      	if z.count(token) == 2 && z.count(' ') == 1
      		y = z.rindex(' ')
      	  rv[arr[y]] += 100 + point_adj
      	end
      end
      rv
    end

    def playable_corners(gameboard)
      corners = [[2,6], [0,8]]
      where_opponent = gameboard.cells.each_index.select { |i| gameboard.cells[i] == @opponent }
      opponent_pos = where_opponent.join.to_i
      corners[0].include?(opponent_pos) ? corners[1] : corners[0]
    end

    def next_move(gameboard, token)
    	points_per_pos = [0,0,0,0,0,0,0,0,0]
      x = [points_per_pos,
    	     pos_values(gameboard, token),
    	     win(gameboard, token, 5),
    	     win(gameboard, @opponent, 0)].transpose.map {|x| x.reduce(:+)}
      if gameboard.turn_count == 1
        max_indicies = x.each_index.select{|i| x[i] == x.max}
        max_indicies.sample
      elsif gameboard.turn_count == 2
        corner_select = playable_corners(gameboard)
        corner_select.sample
      else
        x.rindex(x.max)
      end
    end

    def table_talk
      ["You're a tough opponent!",
      "Ok, I have to think after that move.",
      "Are you sure that was the right move???",
      "Ha! I've got you now =P",
      "Can you move a little faster\n            PLEASE...",
      "Maybe we should start over...",
      "You know I'm going to win right?",
      "I bet you can't beat me ; P",
      "Geez, I'm\n    falling aaaasleep\nover here",
      "Well this has been a fun game!",
      "I'll try to beat you quickly ; D",
      "Did you think that was a good move?",
      "Come on...\nReally?",
      "I'm not arrogant, I'm good ; P",
      "Get the popcorn ready, 'cause I'm gunna put on a show!",
      "I think you're funny =D",
      "You know I can't hear you, right?",
      "You're not going to win. I guarantee that.",
      "There's no one like me, ; D",
      "My style is impetuous, my defense is impregnable, and I'm just ferocious.\nDo you know who said that?",
      "Float like a butterfly and sting like a bee...his hands can't hit what his eyes can't see. - My man Ali!\nLove that guy!"
    ]
    end

  end
end
