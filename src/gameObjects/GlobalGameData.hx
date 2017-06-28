package gameObjects;
import flixel.group.FlxGroup;

typedef GGD = GlobalGameData;
class GlobalGameData
{
	public static var player:Player;
	public static var circle:Circle;
	public static var bullets:FlxGroup;
	public static var energies: FlxGroup;
	public static var fastEnergies: FlxGroup;
	public static var normalFlies: FlxGroup;
	public static var homingFlies: FlxGroup;
	
	public function new() 
	{
		
	}
	
	public static function clear():Void
	{
		player = null;
		circle = null;
		bullets = null;
		energies = null;
		normalFlies = null;
		homingFlies = null;
		fastEnergies = null;
	}
	
	
}