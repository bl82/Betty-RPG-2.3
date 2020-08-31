//Get Player Input
botChangeState = irandom(90);
if (botChangeState >= 5) 
{
	botMoving = irandom(8);

	if (botMoving == 1)
	{
		botDirection = irandom(40);
	}
}
keyLeft = (botDirection == 1) || (botDirection == 5) || (botDirection == 7);
keyRight = (botDirection == 2) || (botDirection == 6) || (botDirection == 8);
keyUp = (botDirection == 3) || (botDirection == 7) || (botDirection == 6);
keyDown = (botDirection == 4) || (botDirection == 8) || (botDirection == 5);

keyActivate = false;
keyAttack = false;
keyItem = false;

inputDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);


if (!global.gamePaused) script_execute(state);