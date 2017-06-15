package gameObjects;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import gameObjects.GlobalGameData.GGD;
import flixel.util.FlxColor;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;

class Fly3 extends Target
{

	public function new() 
	{
		//super(0, 0);
		super();
		reSpawn();
		loadGraphic("img/Malos.png", true, 30, 30);
		/*animation.add("left", [1]);
		animation.add("right", [3]);
		animation.add("up", [2]);
		animation.add("down", [0]);
		animation.add("death", [4, 5, 6, 7], 5, false);
		animation.play("down");*/
		
		//makeGraphic(10, 10, FlxColor.YELLOW);
		width = 30;
		height = 30;
		offset.set(0, 0);	
		
		
	}
	static inline var SPEED:Float = 50;
	override function update(elapsed: Float)
	{
		if (playingDeath)
		{
			velocity.set(0, 0);
			if (animation.finished)
			{
				reSpawn();
				playingDeath = false;
				allowCollisions = FlxObject.ANY;
				//animation.play("down");
			}
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
	
	
	
	/*//var playingDeath:Bool;
	public override function damage():Void
	{
		//animation.play("death");
		allowCollisions = FlxObject.NONE;
		playingDeath = true;
		
		
	}*/
	private override function setSpawnPoint()
	{
		x = GGD.circle.getXCenter();
		y = GGD.circle.getYCenter();
	}

	/*public override function reSpawn()
	{
		var dir:FlxPoint = FlxPoint.weak(Math.random()*2-1, Math.random()*2-1);
		var length:Float = Math.sqrt(dir.x * dir.x + dir.y * dir.y);
		dir.x /= length;
		dir.y /= length;
		dir.x *= 500;
		dir.y *= 500;
		x = GGD.player.x + dir.x;
		y = GGD.player.y + dir.y;
	}*/
	
}