board = [" "," "," "," "," "," "," "," "," "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

display_board(board)


WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8],
[0, 4, 8],
[2, 4, 6]
]

def won?(board)

WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3]

    position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
    return_win_combo
  end
end

#need method of input_to_index with an argument of input
#need to convert user input to an integer
#returns -1 for strings without integers
  def input_to_index(input)
     input.to_i - 1
  end

# def move method (board, index, character)
  def move(board, index, character)
    board[index] = character
end

#need position_taken? method with an arguments of board and index
#make a statement that will say if the space on board is taken

def position_taken?(board, index)
  if (board)[index] == "X" || (board)[index] == "O"
    return true
  else
    return false
  end
end


def valid_move?(board, index)
    if index.between?(0, 8) && !position_taken?(board, index)
    return true
  else
    false
    end
  end


def turn(board)
   puts "Please enter 1-9:"
   input = gets.strip
   index = input_to_index(input)
   if valid_move?(board, index)
   move(board, index, character = "X")
   display_board(board)
 else
   turn(board)
   end
end


def turn_count(board)
  turns = 0
  while turns >= 3
  turns = turns + 1
  position_taken?
  turn_count(board)
  end
end


def current_player(board)
   if turn_count(board) % 2 == 0
      "X"
   else
      "O"
   end
   end


  def full?(board)
  board.all? {|space| space != " " }
end
  #board.all?{|token| token == "X" || token == "O"}\\end

def draw?(board)
  full?(board) && !won?(board)
end


def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end


def winner(board)
  win_combo = won?(board)
  if win_combo != false
    if board[win_combo[0]] == "X"
      return "X"
    else
      return "O"
    end
  else
    return nil
  end
end
