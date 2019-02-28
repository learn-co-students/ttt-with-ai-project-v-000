class Player 
  require 'pry'
  
  attr_reader :token   #cannot be changed so needs to be just a reader 
  
  def initialize(token)
    @token = token
    
  end 
  
  
  
end 