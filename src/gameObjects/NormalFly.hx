package gameObjects;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import gameObjects.GlobalGameData.GGD;
import flixel.util.FlxColor;
import Random;
import flixel.math.FlxAngle;

class NormalFly extends Target
{
	
	public function new(mxSpeed: Float, mnSpeed: Float) 
	{
		super(mxSpeed, mnSpeed);
		
		//maxSpeed = 80;
		//minSpeed = 40;
		
		reSpawn();
		//loadGraphic("img/Malos60x60.png", true, 60, 60);
			loadGraphic("img/MalosSpriteSheet540x44.png", true, 60, 44);
		
		animation.add("flyEnemy", [0,1], 50, true);
		animation.add("death", [2, 3, 4, 5, 6, 7, 8], 14, false);
		animation.play("flyEnemy");
		
		animation.finishCallback = DeathFinished;
		//makeGraphic(10, 10, FlxColor.YELLOW);

		maxVelocity.set(400, 400);
		drag.set(500, 500);
		
		width = 30;
		height = 30;
		offset.set(0, 0);	
		
	}
	public function DeathFinished(animname: String){
		if (animname == "death"){
			reSpawn();
				playingDeath = false;
				allowCollisions = FlxObject.ANY;
				animation.play("flyEnemy");
		}
	
	}
	override function update(elapsed: Float)
	{
		if (playingDeath||outOfBounds())
		{
			velocity.set(0, 0);
			//if (animation.finished)
			//{
				animation.play("death");
				SoundManager.killSound();
				//animation.finishCallback("death");
				
				//animation.play("down");
			//}
		}else{
			
			velocity.set(xSpeed, ySpeed);
			var angleAux = Math.atan(ySpeed / xSpeed) * 57.2958 - 90;
			while (angleAux > 360){
				angleAux = angleAux - 360;
			}
			if (xSpeed > 0 && ySpeed > 0){
					angleAux = angleAux + 180 ;
			
			}
			if (xSpeed > 0 && ySpeed < 0){
					angleAux = angleAux +180;
			
			}
			angle = angleAux;
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
	
	
}