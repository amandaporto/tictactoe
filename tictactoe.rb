
class Board
  def initialize
    @board = [1,2,3,4,5,6,7,8,9]
    @turns = 0
    @winning_combos = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7]
    ]
  end

  def welcome
    puts "Welcome to TicTacToe!"
    print "Player 1, please enter your name : "
    @player1 = gets.chomp
    print "Player 2, please enter your name : "
    @player2 = gets.chomp
    board_with_turns
  end

  def player1_turn
    puts "\nPlease pick your placement"
    print "#{@player1} pick : "
    player_choice = gets.chomp.to_i
      if @board[player_choice - 1] == "0" || @board[player_choice - 1] == "X"
        puts "Invalid positioning, please pick another."
        return
      else
        @board[player_choice - 1] = "X"
      end
    board_with_turns
    @turns += 1
    player_wins("X")
  end

  def player2_turn
    puts "\nPlease pick your placement"
    print "#{@player2} pick : "
    player_choice = gets.chomp.to_i
    ## Why cant I use == 0 || X
    if @board[player_choice - 1] == "0" || @board[player_choice - 1] == "X"
      puts "Invalid positioning, please pick another."
      return
    else
      @board[player_choice - 1] = "0"
    end
    board_with_turns
    @turns += 1
    player_wins("0")
  end

  def board_with_turns
    puts ""
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "----------"
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "----------"
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts ""
  end

  def player_wins (x_or_0)
    if @winning_combos.any? {|winning_combo|
      winning_combo.all? {|position| @board[position-1] == x_or_0}}
      puts "You won!!"
      puts ""
      play
    end
  end


  def play
    welcome
    while @turns < 9
      player1_turn
      player2_turn
    end
  end

end

game = Board.new
game.play
