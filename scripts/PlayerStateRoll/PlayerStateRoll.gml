function PlayerStateRoll() {
	// Movement
	speedRoll = irandom(7) * 1.0;
	distanceRoll = irandom_range(20, 70);
	hSpeed = lengthdir_x(speedRoll, direction);
	vSpeed = lengthdir_y(speedRoll, direction);

	moveDistanceRemaining = max(0, moveDistanceRemaining - speedRoll);
	var _collided = PlayerCollision();

	// Update Sprite
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index)/4;
	image_index = (CARDINAL_DIR * _totalFrames) + min(((1 - (moveDistanceRemaining / distanceRoll)) * (_totalFrames)), _totalFrames - 1);

	// Change State
	if (moveDistanceRemaining <= 0) {
		state = PlayerStateFree;	
	}

	if (_collided) {
		state = PlayerStateBonk;
		moveDistanceRemaining = distanceBonk;	
		ScreenShake(irandom(4), irandom(30))
	}
}
