package gameObjects;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import gameObjects.GlobalGameData.GGD;
import flixel.util.FlxColor;
import Random;

class Fly2 extends Fly
{
	
	public function new() 
	{
		super();
		
		maxXSpeed = 100;
		maxYSpeed = 100;
		minXSpeed = 50;
		minYSpeed = 50;	
		
		reSpawn();
		/*loadGraphic("img/jason.png", true, 55, 70);
		animation.add("left", [1]);
		animation.add("right", [3]);
		animation.add("up", [2]);
		animation.add("down", [0]);
		animation.add("death", [4, 5, 6, 7], 5, false);
		animation.play("down");*/
		
		makeGraphic(10, 10, FlxColor.BLUE);
		maxVelocity.set(400, 400);
		drag.set(500, 500);
		
		width = 10;
		height = 10;
		offset.set(0, 0);	
		
	}
	
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
			
			velocity.set(xSpeed, ySpeed);
			
			
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
	
	
	
	
	private override function setSpawnPoint()
	{
		x = GGD.circle.getXCenter();
		y = GGD.circle.getYCenter();
	}
	
	private override function setSpeed()
	{
		var rangeMinX: Float = Random.float(( -1) * maxXSpeed, ( -1) * minXSpeed);
		var rangeMaxX: Float = Random.float(minXSpeed, maxXSpeed);
		var rangeMinY: Float = Random.float(( -1) * maxYSpeed, ( -1) * minYSpeed);
		var rangeMaxY: Float = Random.float(minYSpeed, maxYSpeed);
		
		xSpeed = Random.float( rangeMinX, rangeMaxX);
		ySpeed = Random.float( rangeMinY, rangeMaxY);
	}
	
	
}