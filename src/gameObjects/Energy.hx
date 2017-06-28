package gameObjects;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import gameObjects.GlobalGameData.GGD;
import gameObjects.GameProgress.GP;
import flixel.util.FlxColor;
import Random;

class Energy extends Target
{
	
	public function new(mxSpeed: Float, mnSpeed: Float) 
	{
		super(mxSpeed, mnSpeed);
		
		reSpawn();
		loadGraphic("img/sphere50x47.png", true, 50, 47);
		
		
		//makeGraphic(10, 10, FlxColor.BLUE);

		maxVelocity.set(400, 400);
		drag.set(500, 500);
		
		width = 50;
		height = 47;
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
	
	public override function outOfBounds(): Bool
	{
		var ret: Bool = super.outOfBounds();
		if (ret)
		{
			GP.attackedByFly(); //CAPAZ QUE ESTE CONVIENE CAMBIARLO DE LUGAR
		}
		return ret;
	}
	
	
}