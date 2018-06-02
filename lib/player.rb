class Player 
attr_reader :token

  def initialize(token)
    @token = token 
  end
  
  def move(board) 
    #binding.pry
    puts "Select A Move: "
    input = gets.strip
  end 
end