package gameObjects;

typedef GGD = GlobalGameData;
class GlobalGameData
{
	public static var player:Player;
	public static var circle:Circle;
	public function new() 
	{
		
	}
	
	public static function clear():Void
	{
		player = null;
		circle = null;
	}
}