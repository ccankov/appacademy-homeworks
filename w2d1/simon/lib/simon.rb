require 'colorize'

class Simon
  COLORS = ['RED'.colorize(:red).freeze,
            'BLUE'.colorize(:blue).freeze,
            'GREEN'.colorize(:green).freeze,
            'YELLLOW'.colorize(:yellow).freeze].freeze

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @seq = []
    @game_over = false
  end

  def play
    system('clear')
    puts "[Enter] to play Simon! Remember the color sequence then play it back.
          Input the colors in the order in which they were displayed."
    gets
    take_turn until @game_over
    game_over_message
    reset_game
  end

  def take_turn
    system('clear')
    puts "#{@sequence_length} color sequence\n"
    show_sequence
    system('clear')
    require_sequence
    round_success_message & (@sequence_length += 1) unless @game_over
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color + "\r"
    end
  end

  def require_sequence

  end

  def add_random_color
    new_color = COLORS.sample
    @seq << new_color
  end

  def round_success_message
    puts 'Correct! Prepare for the next round...'
  end

  def game_over_message
    puts 'Wrong sequence! You lose.'
  end

  def reset_game
    initialize
  end
end
