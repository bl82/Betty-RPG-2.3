/// @desc Entity Loop
if (!global.gamePaused) {
	depth = -bbox_bottom;	
	if (lifted) && (instance_exists(oPlayer)) {
		if (oPlayer.sprite_index != sPlayerLift) {
			x = oPlayer.x;
			y = oPlayer.y;
			z = liftZ[oPlayer.localFrame];
			depth = oPlayer.depth-1;
		}
	}
	
	if (!lifted) {
		// Be thrown, if thrown
		if (thrown) {
			throwDistanceTravelled = min(throwDistanceTravelled + 3, throwDistance) 
			x = xstart + lengthdir_x(throwDistanceTravelled, direction);
			y = ystart + lengthdir_y(throwDistanceTravelled, direction);
			if (tilemap_get_at_pixel(collisionMap, x, y) > 0) {
				thrown = false;
				grav = 0.1;
			}
		
			throwPercent = throwStartPercent + lerp(0,1 - throwStartPercent, throwDistanceTravelled / throwDistance);
			z = throwPeakHeight * sin(throwPercent * pi);		
			if (throwDistance == throwDistanceTravelled) {
				thrown = false;
				if (entityThrowBreak) {
					event_user(1);
				}
			}
		} else {
			// Fall back to earth if above zero Z
			if (z > 0) {
				z = max(z - grav, 0)
				grav += 0.1;
				if (z == 0) && (entityThrowBreak) event_user(1);
			} else {
				grav = 0.1;	
			}
		}	
	}
}

flash = max(flash - 0.04, 0);