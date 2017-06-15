package gameObjects;
import gameObjects.GameProgress.GP;
import gameObjects.SoundManager.SM;

typedef COLL = Collisions;

class Collisions 
{

	public function new() 
	{
		
	}
	
	public static function clear()
	{
		
	}
	
	public static function bulletsVsTarget(aBullet:Bullet,aTarget:Target)
	{
		aBullet.kill();
		aTarget.damage();
	}
	
	public static function playerVsFly(aPlayer:Player,aFly:Target) 
	{
		aFly.damage();
		GP.attackedByFly();
	}
	
	public static function bulletsVsEnergy(aBullet:Bullet,aEnergy:Energy)
	{
		aBullet.kill();
		aEnergy.damage();
	}
	
	public static function playerVsEnergy(aPlayer:Player,aEnergy:Energy) 
	{
		aEnergy.damage();
		GP.gotEnergy();
		SM.gotEnergySound();
	}
	
}