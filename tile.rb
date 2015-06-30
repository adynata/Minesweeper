class Tile
  DELTAS = [[1,1], [1,0], [1,-1], [0,1], [0,-1], [-1,1], [-1,0], [-1,-1]]
  attr_accessor :hidden, :bomb, :flagged
  attr_reader :position, :board

  def initialize(pos, board)
    @hidden = true
    @bomb = false
    @flagged = false
    @position = pos
    @board = board
  end

  def neighbors
    @neighbors ||= DELTAS.map do |del|
      [ position[0] + del[0], position[1] + del[1] ]
    end.select do |new_pos|
      (new_pos[0] >= 0) && (new_pos[1] >= 0) && (new_pos[0] <= 8) && (new_pos[1] <= 8)
    end
  end

  def count_neighbor_bombs
    count = 0
    neighbors.each do |n|
      count += 1 if board[n].has_bomb? 
    end
  end

end



t = Tile.new([8,8])

p t.neighbors
