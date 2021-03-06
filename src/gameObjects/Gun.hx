package gameObjects;
import flixel.FlxG;
import flixel.group.FlxGroup;
import gameObjects.GlobalGameData.GGD;
import gameObjects.SoundManager.SM;

class Gun
{

	var bullets:FlxGroup;
	public function new(aBullets:FlxGroup) 
	{
		bullets = aBullets;
	}
	
	public function fire(aX:Float, aY:Float)
	{
		//var deltaX:Float = FlxG.mouse.x - aX;
		//var deltaY:Float = FlxG.mouse.y - aY;
		var deltaX:Float = GGD.circle.getXCenter() - aX;
		var deltaY:Float = GGD.circle.getYCenter() - aY;
		
		var length:Float = Math.sqrt(deltaX * deltaX + deltaY * deltaY);
		
		var bullet:Bullet =cast bullets.recycle(Bullet);
		bullet.shoot(aX, aY, deltaX / length, deltaY / length);
		SM.fireSound();
	}
}