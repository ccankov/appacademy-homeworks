require_relative 'player.rb'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = Player.new(name1, 1)
    @player2 = Player.new(name2, 2)
    @cups = []
    place_stones
  end

  def place_stones
    (0..13).each do |cup|
      @cups[cup] = [6, 13].include?(cup) ? [] : %i(stone stone stone stone)
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' unless start_pos.between?(1, 13)
  end

  def make_move(start_pos, current_player_name)
    distance = @cups[start_pos].length
    skip_idx = @player1.name == current_player_name ? 12 : 5
    @cups[start_pos] = []
    distance.times do
      idx_increment = (start_pos == skip_idx ? 2 : 1)
      start_pos = (start_pos + idx_increment) % 14
      @cups[start_pos] << :stone
    end
    render
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    return :prompt if [13, 6].include?(ending_cup_idx)
    if @cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    left = @cups[0..5].all?(&:empty?)
    right = @cups[7..12].all?(&:empty?)
    left || right
  end

  def winner
    player2_points = @cups[13].length
    player1_points = @cups[6].length
    case player1_points <=> player2_points
    when 1
      @player1.name
    when 0
      :draw
    when -1
      @player2.name
    end
  end
end
