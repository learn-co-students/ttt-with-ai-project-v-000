require_relative '../player.rb'

class Player::Human < Player
  def initialize(token)
		@token = token
    @type = :human
	end
  def move(useless_arr=[])
    puts("#{@token}: Enter your move. ")
    gets.chomp
	end
end