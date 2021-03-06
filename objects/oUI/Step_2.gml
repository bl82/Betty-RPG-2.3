if (room == rTitle) {
	visible = false;
} else {
	visible = true;
}

if (global.gamePaused) {
	keyUp = keyboard_check_pressed(vk_up);
	keyDown = keyboard_check_pressed(vk_down);
	pauseOptionSelected += (keyDown - keyUp);
	if (pauseOptionSelected >= array_length(pauseOption)) pauseOptionSelected = 0;
	if (pauseOptionSelected < 0) pauseOptionSelected = array_length(pauseOption) -1;

	keyActivate = keyboard_check_pressed(vk_space);
	if (keyActivate) {
		switch (pauseOptionSelected) {
			case 0: { // Continue
				global.gamePaused = false;
				with (all) {
					gamePausedImageSpeed = image_speed;
					image_speed = 0;
				}
			} 
			break;
			case 1: { // Save and quit
				global.gameSave = true;
				SaveLatestGame();
				with (oGame) instance_destroy();
				game_restart();	
			}
			break;
			case 2: { // Save and quit to desktop
				global.gameSave = true;
				SaveLatestGame();
				game_end();
			} 
			break;
		}
	}
}

