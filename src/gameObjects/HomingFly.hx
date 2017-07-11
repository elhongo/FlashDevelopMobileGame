package gameObjects;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import gameObjects.GlobalGameData.GGD;
import flixel.util.FlxColor;
import Random;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;

class HomingFly extends Target
{
	var SPEED: Float;
	
	public function new(mxSpeed: Float, mnSpeed: Float) 
	{
		super(mxSpeed, mnSpeed);
		
		reSpawn();
		
		loadGraphic("img/Malos60x60.png", true, 60, 60);
		
		//makeGraphic(10, 10, FlxColor.YELLOW);
		width = 30;
		height = 30;
		offset.set(0, 0);
		
		SPEED = maxSpeed;
	}
	
	//static inline var SPEED:Float = 100;
	
	override function update(elapsed: Float)
	{
		if (playingDeath||outOfBounds())
		{
			velocity.set(0, 0);
			//if (animation.finished)
			//{
				reSpawn();
				playingDeath = false;
				allowCollisions = FlxObject.ANY;
				//animation.play("down");
			//}
		}else{
			
			var player:Player = GlobalGameData.player;
			var deltaX:Float = player.x + player.width / 2 - (x + width / 2);
			var deltaY:Float = player.y + player.height / 2 - (y + height);
			var length:Float = Math.sqrt(deltaX * deltaX + deltaY * deltaY);
			velocity.set(deltaX / length * SPEED, deltaY / length * SPEED);
			
			angle = FlxAngle.angleBetweenPoint(this, new FlxPoint(player.x, player.y), true) + 90;
			
			if (Math.abs(velocity.x) > Math.abs(velocity.y))
			{
				if (velocity.x > 0)
				{
					//animation.play("right");
				}else {
					//animation.play("left");
				}
			}else {
				if (velocity.y > 0)
				{
					//animation.play("down");
				}else {
					//animation.play("up");
				}
			}
		}
		
		super.update(elapsed);
	}
	
	
	public override function reSpawn()
	{		
		setSpeed();
		setSpawnPoint();	
	}
	
	private override function setSpawnPoint()
	{		
		x = GGD.circle.getXCenter();
		y = GGD.circle.getYCenter();
	}
	
	private override function setSpeed()
	{
		var dir:FlxPoint = FlxPoint.weak(Math.random()*2-1, Math.random()*2-1);
		var length:Float = Math.sqrt(dir.x * dir.x + dir.y * dir.y);
		dir.x /= length;
		dir.y /= length;
		dir.x *= 500;
		dir.y *= 500;
	}
	
	
}