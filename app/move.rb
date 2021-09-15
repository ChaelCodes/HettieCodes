# This function is called on every turn of a game. It's how your Battlesnake decides where to move.
# Valid moves are "up", "down", "left", or "right".
POSSIBLE_MOVES = ["up", "left", "down", "right"]

def move(request)
  board = request[:board]
  me = request[:you]
  POSSIBLE_MOVES.each do |direction|
    return move_direction(direction) if can_move_direction?(board, me, direction)
  end
end

def can_move_direction?(board, me, direction)
  return false if direction == "up" && me[:head][:y] == 0
  return false if direction == "down" && me[:head][:y] == board[:height] - 1
  return false if direction == "left" && me[:head][:x] == 0
  return false if direction == "right" && me[:head][:x] == board[:width] - 1
  return true
end

def move_direction(direction)
  {
    "move": direction,
    "shout": "Let's move #{direction}!"
  }
end
