require './board'
require './human'
require './computer'
require './settings'

class Game
  def initialize
    @board = ::Board.new
    @settings = ::Settings.new
    @first_player = @settings.setup_player_one
    @second_player = @settings.setup_player_two
  end

  def start_game
    puts "###### Welcome to TicTacToe ######"
    print_board
    puts "##################################"

    until stop_game
      first_player.move(@board, board.available_spaces)
      print_board

      if !stop_game
        second_player.move(@board, board.available_spaces)
        print_board
      end

      puts "##################################"
    end

    ending_message
  end

  private
  
  attr_reader :board, :first_player, :second_player

  def stop_game
    game_is_over? || game_is_tied?
  end

  def print_board
    board.show
  end

  def game_is_tied?
    board.game_is_tied?
  end

  def game_is_over?
    board.game_is_over?
  end

  def ending_message
    if game_is_tied?
      puts "Game Over. It's a tie!"
      return
    end
   
    puts "Game Over. Congratulations #{winner_name}!"
  end

  def winner_name
    winner_mark = board.get_winner_mark

    return if !winner_mark

    return first_player.name if winner_mark == first_player.mark

    second_player.name
  end
end

game = Game.new
game.start_game
