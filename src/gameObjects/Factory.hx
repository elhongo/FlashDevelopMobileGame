package gameObjects;
import gameObjects.GlobalGameData.GGD;
import flixel.group.FlxGroup;

typedef FAC = Factory;

class Factory 
{

	public function new() 
	{
		
		
	}
	
	public static function clear()
	{
		
	}
	
	public static function createPlayer(startPointX: Float, startPointY: Float, aCircle: Circle)
	{
		GGD.bullets = new FlxGroup();
		var nPlayer: Player = new Player(new Gun(GGD.bullets), startPointX, startPointY, aCircle);
		GGD.player = nPlayer;
	}
	
	public static function createCircle(xCenter: Float, yCenter:Float, radius:Float) 
	{
		var nCircle: Circle = new Circle(xCenter, yCenter, radius);
		GGD.circle = nCircle;
	}
	
	/*public static function createGun() 
	{
		nGun: Gun = new Gun(new FlxGroup);
	}*/
	
	public static function createEnergies(cuantity: Int)
	{
		var nEnergies: FlxGroup = new FlxGroup();
		for (i in 0...cuantity)
		{
			nEnergies.add(new Energy());
		}
		GGD.energies = nEnergies;
	}
	
	public static function createNormalFlies(cuantity: Int)
	{
		var nFlies: FlxGroup = new FlxGroup();
		for (i in 0...cuantity)
		{
			nFlies.add(new NormalFly());
		}
		GGD.normalFlies = nFlies;
	}
	
	public static function createHomingFlies(cuantity: Int)
	{
		var nFlies: FlxGroup = new FlxGroup();
		for (i in 0...cuantity)
		{
			nFlies.add(new HomingFly());
		}
		GGD.homingFlies = nFlies;
	}
}