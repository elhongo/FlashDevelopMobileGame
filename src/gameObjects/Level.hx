package gameObjects;
import gameObjects.GameProgress.GP;
import gameObjects.GlobalGameData.GGD;
import gameObjects.Factory.FAC;

typedef LVL = Level;

class Level 
{
	private static var levelNumber: Int;

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
		switch(levelNumber)
		{
			case 1:
				FAC.createCircle(370, 215, 200);
				FAC.createPlayer(GGD.circle.getXCenter() - GGD.circle.getRadius(), GGD.circle.getYCenter(), GGD.circle);
				FAC.createEnergies(10);
				FAC.createNormalFlies(3);
				FAC.createHomingFlies(0);
				GP.setLevel(1);
			case 2:
				FAC.createCircle(370, 215, 200);
				FAC.createPlayer(GGD.circle.getXCenter() - GGD.circle.getRadius(), GGD.circle.getYCenter(), GGD.circle);
				FAC.createEnergies(10);
				FAC.createNormalFlies(4);
				FAC.createHomingFlies(1);
				GP.setLevel(2);
			case 3:
				FAC.createCircle(370, 215, 200);
				FAC.createPlayer(GGD.circle.getXCenter() - GGD.circle.getRadius(), GGD.circle.getYCenter(), GGD.circle);
				FAC.createEnergies(10);
				FAC.createNormalFlies(6);
				FAC.createHomingFlies(1);
				GP.setLevel(3);
			default:
				FAC.createCircle(370, 215, 200);
				FAC.createPlayer(GGD.circle.getXCenter() - GGD.circle.getRadius(), GGD.circle.getYCenter(), GGD.circle);
				FAC.createEnergies(10);
				FAC.createNormalFlies(1);
				FAC.createHomingFlies(1);
				GP.setLevel(0);
		}
	}
	
}