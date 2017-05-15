package gameObjects;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.motion.CircularMotion;
import flixel.math.FlxPoint;


class Player extends FlxSprite
{
	static inline var ACCELERATION:Float = 1000;
	var gun:Gun;
	var circle: Circle;
	
	var pointPlayer: FlxPoint;
	var pointCenter: FlxPoint;
	
	public function new(aGun:Gun, X:Float = 0, Y:Float = 0, aCircle: Circle) 
	{
		super(X, Y);
		
		//makeGraphic(20, 20);
		loadGraphic("img/Bueno60x60.png", true,60,60);
		maxVelocity.set(200, 200);
		drag.set(300, 300);
		gun = aGun;
		circle = aCircle;
		
		pointPlayer = new FlxPoint(X, Y);
		pointCenter = new FlxPoint(aCircle.getXCenter(), aCircle.getYCenter());
	}
	
	override public function update(elapsed: Float)
	{
		acceleration.set(0,0);
		if (FlxG.keys.pressed.LEFT)
		{
			//acceleration.x -= ACCELERATION;
			
			pointPlayer.rotate(pointCenter, -5);
			x = pointPlayer.x;
			y = pointPlayer.y;
		}
		if (FlxG.keys.pressed.RIGHT)
		{
			//acceleration.x += ACCELERATION;
			
			pointPlayer.rotate(pointCenter, 5);
			x = pointPlayer.x;
			y = pointPlayer.y;
		}
		/*if (FlxG.keys.pressed.UP)
		{
			acceleration.y -= ACCELERATION;
		}
		if (FlxG.keys.pressed.DOWN)
		{
			acceleration.y += ACCELERATION;
		}*/
		if (FlxG.mouse.justPressed)
		{
			gun.fire(x, y);
		}
		if (FlxG.keys.justPressed.CONTROL || FlxG.keys.justPressed.SPACE){
			gun.fire(x, y);
		}
		
		super.update(elapsed);
	}
	
}