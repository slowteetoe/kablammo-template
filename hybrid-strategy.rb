module HybridStrategy
  def hunt
    x, y = robot.x, robot.y
    return first_possible_move 'nesw' if x == 0
    return first_possible_move 'eswn' if y == @battle.board.height - 1
    return first_possible_move 'swne' if x == @battle.board.width - 1
    return first_possible_move 'wnes' if y == 0
    first_possible_move 'wsen'
  end

  def fire_at!(enemy, compensate = 0)
    direction = robot.direction_to(enemy).round
    skew = direction - robot.rotation
    distance = robot.distance_to(enemy)
    max_distance = Math.sqrt(board.height * board.height + board.width * board.width)
    compensation = ( 10 - ( (10 - 3) * (distance / max_distance) ) ).round
    compensation *= -1 if rand(0..1) == 0
    skew += compensation if compensate > rand
    fire! skew
  end

  def act_like_a_robot!
    enemy = opponents.first
    return hunt unless enemy
    if enemy
    	return aim_at! enemy unless aiming_at? enemy
    	if my.ammo > 0
    		return fire_at! enemy, 0.75 if can_fire_at? enemy
    	else
    		return rest
    	end
    	return move_towards! enemy
    end
    if my.ammo == 0
    	return rest
    end
  end
end