# This function is called on every turn of a game. It's how your Battlesnake decides where to move.
# Valid moves are "up", "down", "left", or "right".
POSSIBLE_MOVES = ["up", "left", "down", "right"]

def move(request)
  board = request[:board]
  me = request[:you]
  POSSIBLE_MOVES.each do |direction|
    return move_direction(direction, me) if can_move_direction?(board, me, direction)
  end
end

# TODO: Refactor this function
def can_move_direction?(board, me, direction)
  return false if direction == "up" && (me[:head][:y] >= board[:height] - 1 || collides_with_body?(me, me[:head][:x], me[:head][:y] + 1))
  return false if direction == "down" && (me[:head][:y] == 0  || collides_with_body?(me, me[:head][:x], me[:head][:y] - 1))
  return false if direction == "left" && (me[:head][:x] == 0 || collides_with_body?(me, me[:head][:x] - 1, me[:head][:y]))
  return false if direction == "right" && (me[:head][:x] == board[:width] - 1 || collides_with_body?(me, me[:head][:x] + 1, me[:head][:y]))
  return true
end

def move_direction(direction, me)
  {
    "move": direction,
    "shout": "I'm at #{me[:head][:x]}, #{me[:head][:y]}!"
  }
end

def collides_with_body?(me, x, y)
  me[:body].any? { |body| body[:x] == x && body[:y] == y }
end
