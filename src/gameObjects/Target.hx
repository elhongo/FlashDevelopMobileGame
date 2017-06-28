package gameObjects;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import gameObjects.GlobalGameData.GGD;
import gameObjects.GameProgress.GP;
import flixel.util.FlxColor;
import Random;

class Target extends FlxSprite
{

	var xSpeed: Float;
	var ySpeed: Float;
	
	var maxSpeed: Float;
	var minSpeed: Float;
	
	//static inline var SPEED:Float = 100;
	var playingDeath:Bool;
	
	public function new(mxSpeed: Float, mnSpeed: Float) 
	{
		super(0, 0);
		
		//maxSpeed = 100;
		//minSpeed = 50;
		
		maxSpeed = mxSpeed;
		minSpeed = mnSpeed;
		
		/*loadGraphic("img/jason.png", true, 55, 70);
		animation.add("left", [1]);
		animation.add("right", [3]);
		animation.add("up", [2]);
		animation.add("down", [0]);
		animation.add("death", [4, 5, 6, 7], 5, false);
		animation.play("down");*/
		
		//makeGraphic(10, 10, FlxColor.BLUE);
		//maxVelocity.set(400, 400);
		//drag.set(500, 500);
		
		width = 10;
		height = 10;
		offset.set(0, 0);		
		
	}
	
	override function update(elapsed: Float)
	{
		
		super.update(elapsed);
	}
	
	public function damage():Void
	{
		//animation.play("death");
		allowCollisions = FlxObject.NONE;
		playingDeath = true;
		
		
	}
	public function reSpawn()
	{		
		setSpeed();
		setSpawnPoint();	
	}
	
	
	
	
	private function setSpawnPoint()
	{
		x = GGD.circle.getXCenter();
		y = GGD.circle.getYCenter();
	}
	
	private function setSpeed()
	{	
		var finalSpeedX: Float = Random.float(minSpeed, maxSpeed);
		var finalSpeedY: Float = Random.float(minSpeed, maxSpeed);
		var negativeOrPositive: Float = Random.float( -1, 1);
		if (negativeOrPositive < 0)
		{
			finalSpeedX = finalSpeedX * ( -1);
		}
		negativeOrPositive = Random.float( -1, 1);
		if (negativeOrPositive < 0)
		{
			finalSpeedY = finalSpeedY * ( -1);
		}
		xSpeed = finalSpeedX;
		ySpeed = finalSpeedY;
	}
	
	
	
	public function outOfBounds(): Bool
	{
		if (x<(GGD.circle.getXCenter() - GGD.circle.getRadius() - 50) || x>(GGD.circle.getXCenter() + GGD.circle.getRadius() + 50) ||
		y<(GGD.circle.getYCenter() - GGD.circle.getRadius() - 50) || y>(GGD.circle.getYCenter() + GGD.circle.getRadius() + 50))
		{
			//GP.attackedByFly(); //CAPAZ QUE ESTE CONVIENE CAMBIARLO DE LUGAR
			return true;
		}
		return false;
	}
	
}