# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

# Define display_board that accepts a board and prints
# out the current state.
def display_board(board)
   puts " #{board[0]} | #{board[1]} | #{board[2]} "
   puts"-----------"
   puts " #{board[3]} | #{board[4]} | #{board[5]} " 
   puts"-----------"
   puts " #{board[6]} | #{board[7]} | #{board[8]} "
 end
 
 # code your input_to_index and move method here!
def input_to_index(user_input)
  converted_input="#{user_input}".to_i - 1
end

# move
def move(board,my_input,my_char='X')
  my_char=current_player(board)
  
  board["#{my_input}".to_i]=my_char
end 

# code your #valid_move? method here
def valid_move?(board,index)
  if !position_taken?(board,index) && index.between?(0,8)
     return true 
  else
    return false
  end  
end  
# code your #position_taken? method here!
def position_taken?(board,index)
  if(board[index]==" ")||(board[index]=="")||(board[index]==nil)
     pos=false;
  elsif (board[index]=="X")||(board[index]=="O")
     pos= true;
  else  
  end
  return pos;
    
end

#single complete turn
def turn(board)
   puts "Please enter 1-9:"
   input=gets.strip
   index=input_to_index(input)
   if(valid_move?(board,index))
     move(board,index)
     display_board(board)
    else
      
      
    end
 end
 
 #number of turns played

def turn_count(board)
   turnCount=0
   board.each do |board| 
    if board=="X"|| board=="O"
      then turnCount+=1
    end
   end
  return turnCount
 end

#who's turn is it now
def current_player(board)
  return turn_count(board).even? ?  "X":"O"
end  
def won?(board)
 WIN_COMBINATIONS.each { |win_combination| 
  win_index_1=win_combination[0]
  win_index_2=win_combination[1]
  win_index_3=win_combination[2]
 
   position_1=board[win_index_1]
   position_2=board[win_index_2]
   position_3=board[win_index_3]
     
      if (position_1 == "X" && position_2 == "X" && position_3 == "X")||(position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      else
        false
      end 
  }
  return false
  end
 
  def full?(board)
  board.none?{|board| board==" "}
  end
  
  def draw?(board)
   if !won?(board) && full?(board) then true
   else  false
   end
   end

def over?(board)
 if turn_count(board)==1 then false 
   #elsif turn_count(board)==2 then true
 end
 if(won?(board)||draw?(board)||full?(board)) then true
 else false
 end
 end
 
 def winner(board)
   index=[]
   index=won?(board)
   if index==false then nil
    elsif board[won?(board)[0]]=="X" then "X" 
    elsif board[won?(board)[0]]=="O" then "O"
    end
 end
 # Define your play method below
def play(board)
  
  while !over?(board)
  turn(board)
  end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
      
    elsif draw?(board)
      puts "Cat's Game!"
      
    end
      
    end
  
