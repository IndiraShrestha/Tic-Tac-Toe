#Tic Tac toe game
# Diplay the borad
# Ask user to input a square
#Ask another user to input a square 
# check winning if three sq ( 8 possiblity are done)
#diplay winner
#check for tie
# if not continue to input square 
# play again
require "pry"
class Board 
  attr_accessor :board, :check, :turn

  def initialize 
    @board = []
    @board << [1, 2, 3]
    @board << [4, 5, 6]
    @board << [7, 8, 9]
    @check = []
  end  

  def display_board
    @board 
    @board.each do |x|
      puts x.join('|')
      puts "_______"
    end 
    puts @board
  end 

  def check_move(position)
    if @check.include?(position)
      puts "That position is already taken"
    else
      @check << position
    end  
  end  

  def move(position, player)
      @board.each do |row|
        row.each_index do |column|
          if position == row[column] && player == "Player1"
            row[column] = "X"  
          elsif position == row[column] && player == "Player2"
            row[column] = "O"
          end  
        end
      end    
  end  

  def winning?
    if @board[0][0] == @board[0][1] and @board[0][1] == @board[0][2]
      puts "Player 1 wins" if @board[0][0] == "X" 
      puts "Player 2 wins" if @board[0][0] == "O"
      return false
    elsif @board[1][0] == @board[1][1] and @board[1][1] == @board[1][2]
      puts "Player 1 wins" if @board[1][0] == "X"
      puts "Player 2 wins" if @board[1][0] == "O"
      return false
    elsif @board[2][0] == @board[2][1] and @board[2][1] == @board[2][2]
      puts "Player 1 wins" if @board[0][0] == "X"
      puts "Player 2 wins" if @board[0][0] == "O"
      return false
    elsif @board[0][0] == @board[1][0] and @board[1][0] == @board[2][0]
      puts "Player 1 wins" if @board[0][0] == "X"
      puts "Player 2 wins" if @board[0][0] == "O"
      return false
    elsif @board[0][1] == @board[1][1] and @board[1][1] == @board[2][1]
      puts "Player 1 wins" if @board[0][1] == "X"
      puts "Player 2 wins" if @board[0][1] == "O"
      return false
    elsif @board[0][2] == @board[1][2] and @board[1][2] == @board[2][2]
      puts "Player 1 wins" if @board[0][2] == "X"
      puts "Player 2 wins" if @board[0][2] == "O"
      return false
    elsif @board[0][0] == @board[1][1] and @board[1][1] == @board[2][2]
      puts "Player 1 wins" if @board[0][0] == "X"
      puts "Player 2 wins" if @board[0][0] == "O"
      return false
    elsif @board[0][2] == @board[1][1] and @board[1][1] == @board[2][0]
      puts "Player 1 wins" if @board[0][2] = "X"
      puts "Player 2 wins" if @board[0][2] = "O"
      return false
    end    
  end
  
  def tie?
    flattened_board = @board.flatten
    turn = 0
    flattened_board.each_index do |x|
      if flattened_board[x].class == String
        turn += 1 
      end  
    end  
    if turn == 9
      puts "Stalemate"
      return false
    end
  end  

end 

board = Board.new
board.display_board


while true  
  puts "Which position would you like to mark Player 1?"
  position = gets.chomp.to_i

  board.move(position, "Player1")
 
  system 'clear'
  board.check_move(position)
  board.display_board

  break if board.winning? == false || board.tie? == false

  puts "Which position would you like to mark Player 2?"
  position = gets.chomp.to_i
  board.move(position, "Player2")
 
  system 'clear'
  board.check_move(position)
  board.display_board
  break if board.winning? == false || board.tie? == false
  # binding.pry
end  

