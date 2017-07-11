package gameObjects;
import gameObjects.GameProgress.GP;
import gameObjects.GlobalGameData.GGD;
import gameObjects.Factory.FAC;

typedef LVL = Level;

class Level 
{
	private static var levelNumber: Int;
	public static var CircleCenterX: Int;
	public static var CircleCenterY: Int;
	public static var CircleRadius: Int;
	
	public function new() 
	{
		
	}
	
	public static function clear()
	{
		levelNumber = 0;
	}
	
	public static function getLevel()
	{
		return levelNumber;
	}
	
	public static function setLevel(number: Int)
	{
		levelNumber = number;
	}
	
	public static function setUpLevel()
	{
		CircleCenterX = 960 - 60;
		CircleCenterY = 540 - 60;
		CircleRadius = 440;
		switch(levelNumber)
		{
			case 1:
				FAC.createCircle(CircleCenterX, CircleCenterY, CircleRadius);
				FAC.createPlayer(GGD.circle.getXCenter() - GGD.circle.getRadius(), GGD.circle.getYCenter(), GGD.circle);
				FAC.createEnergies(10, 100, 40);
				FAC.createFastEnergies(0, 0, 0);
				FAC.createNormalFlies(3, 80, 30);
				FAC.createHomingFlies(0, 0, 0);
				GP.setLevel(1);
			case 2:
				FAC.createCircle(CircleCenterX, CircleCenterY, CircleRadius);
				FAC.createPlayer(GGD.circle.getXCenter() - GGD.circle.getRadius(), GGD.circle.getYCenter(), GGD.circle);
				FAC.createEnergies(10, 100, 50);
				FAC.createFastEnergies(1, 200, 50);
				FAC.createNormalFlies(4, 100,50);
				FAC.createHomingFlies(1, 100, 50);
				GP.setLevel(2);
			case 3:
				FAC.createCircle(CircleCenterX, CircleCenterY, CircleRadius);
				FAC.createPlayer(GGD.circle.getXCenter() - GGD.circle.getRadius(), GGD.circle.getYCenter(), GGD.circle);
				FAC.createEnergies(10, 120, 50);
				FAC.createFastEnergies(3, 200, 50);
				FAC.createNormalFlies(6, 120, 50);
				FAC.createHomingFlies(1, 120, 50);
				GP.setLevel(3);
			default:
				FAC.createCircle(CircleCenterX, CircleCenterY, CircleRadius);
				FAC.createPlayer(GGD.circle.getXCenter() - GGD.circle.getRadius(), GGD.circle.getYCenter(), GGD.circle);
				FAC.createEnergies(10, 100, 50);
				FAC.createFastEnergies(1, 200, 50);
				FAC.createNormalFlies(1, 100, 50);
				FAC.createHomingFlies(1, 100, 50);
				GP.setLevel(0);
		}
	}
	
}