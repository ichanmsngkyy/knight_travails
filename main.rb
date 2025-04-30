# frozen_string_literal: true

# Knight Travail
class KnightTravail
  MOVES = [[2, 1], [-2, 1], [1, 2], [-1, -2],
           [-2, -1], [1, -2], [2, -1], [-1, 2]]

  def valid_pos?(x, y)
    x.between?(0, 7) && y.between?(0, 7)
  end

  def knight_moves(start, target)
    queue = []
    visited = {}
    queue << [start, [start]]

    until queue.empty?
      current_pos, path = queue.shift
      if current_pos == target
        print_path(path)
        return path
      end

      new_moves = MOVES.map { |dx, dy| [current_pos[0] + dx, current_pos[1] + dy] }
                       .select { |x, y| valid_pos?(x, y) && !visited[[x, y]] }

      new_moves.each do |move|
        visited[move] = true
        queue << [move, path + [move]]
      end
    end
    path
  end

  def print_path(path)
    puts "You made it in #{path.length - 1} moves!"
    path.each { |pos| p pos }
  end
end

knight = KnightTravail.new
knight.knight_moves([0, 0], [7, 7])
