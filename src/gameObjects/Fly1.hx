package gameObjects;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import gameObjects.GlobalGameData.GGD;
import flixel.util.FlxColor;
import Random;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;

class Fly1 extends Fly
{
	
	public function new() 
	{
		super();
		
		/*maxXSpeed = 100;
		maxYSpeed = 100;
		minXSpeed = 50;
		minYSpeed = 50;*/
		
		reSpawn();
		/*loadGraphic("img/HoleWhite.png", true, 55, 70);
		animation.add("left", [1]);
		animation.add("right", [3]);
		animation.add("up", [2]);
		animation.add("down", [0]);
		animation.add("death", [4, 5, 6, 7], 5, false);
		animation.play("down");
		
		//makeGraphic(15, 15, FlxColor.GREEN);
		
		width = 15;
		height = 15;
		offset.set(0, 0);*/
		
		loadGraphic("img/Malos.png", true, 30, 30);
		
		//makeGraphic(10, 10, FlxColor.YELLOW);
		width = 30;
		height = 30;
		offset.set(0, 0);	
		
	}
	
	static inline var SPEED:Float = 100;
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
		/*var dir:FlxPoint = FlxPoint.weak(Math.random()*2-1, Math.random()*2-1);
		x = GGD.player.x + dir.x;
		y = GGD.player.y + dir.y;*/
		
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