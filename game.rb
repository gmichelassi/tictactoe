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

    puts "Game over"
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
end

game = Game.new
game.start_game
