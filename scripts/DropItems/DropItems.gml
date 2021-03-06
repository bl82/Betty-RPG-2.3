/// @desc DropItems(x, y, [items])
/// @arg x
/// @arg y
/// @arg [items] array of items to drop
function DropItems(argument0, argument1, argument2) {
	var _items = array_length_1d(argument2);
	if (_items >= 1) {
		var _countS = 0;
		var _countE = _items;
		var _anglePerItem = 360 / (_countE - _countS);
		var _angle = random(360);
		for (var i = _countS; i < _countE; i++) {
			with (instance_create_layer(argument0, argument1, "Instances", argument2[i])) {
				direction = _angle;
				spd = 0.75 + (random(15) * 0.1) + random((_items / 60) * 0.2);
			}
			_angle += _anglePerItem;
		}
	} 
	
	if (_items <= 0) {
		instance_create_layer(argument0,argument1,"Instances",argument2[0]);
	}
}
