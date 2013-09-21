module HybridStrategy
  class << self
    attr_accessor :armor_last_turn
  end
  def hunt
    x, y = robot.x, robot.y
    return first_possible_move random_choices_from("nse") if x == 0
    return first_possible_move random_choices_from('esw') if y == @battle.board.height - 1
    return first_possible_move random_choices_from('ewn') if x == @battle.board.width - 1
    return first_possible_move random_choices_from('nws') if y == 0
    first_possible_move 'nsew'
  end

  def random_choices_from(dirs)
    dirs.split("").shuffle.join("")
  end

  def fire_at!(enemy, compensate = 0)
    direction = robot.direction_to(enemy).round
    skew = direction - robot.rotation
    fire! skew
  end

  def act_like_a_robot!
    @armor_last_turn ||= MAX_ARMOR
    if robot.armor < MAX_ARMOR && robot.armor < @armor_last_turn
      # someone hit us, juke!
      @armor_last_turn = robot.armor
      return juke!
    end
    enemy = opponents.first
    return hunt unless enemy
    if enemy
    	return aim_at! enemy unless aiming_at? enemy
    	if my.ammo > 0
    		return fire_at! enemy, 0 if can_fire_at? enemy
    	else
    		return rest
    	end
    	return move_towards! enemy
    end
    if my.ammo == 0
    	return rest
    end
  end

  def juke!
    return hunt
  end

end