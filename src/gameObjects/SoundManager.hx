package gameObjects;

import flixel.FlxG;
import flixel.FlxG.sound;
import flixel.system.FlxSound;

typedef SM = SoundManager;

class SoundManager 
{
	
	public function new() 
	{

	}
	
	public static function clear():Void
	{
		
	}
	
	public static function gotEnergySound()
	{
		sound.playMusic("sound/Agarrar esfera.wav", 20, false);
	}
	
	public static function fireSound()
	{
		sound.playMusic("sound/Disparos.wav", 20, false);
	}
	
	public static function levelStartSound()
	{
		sound.playMusic("sound/Comienzo nivel.wav", 20, false);
	}
	
	
	public static function checkTracks()
	{
		var percentage: Float = GameProgress.getPercentage();
		if (percentage < 20)
		{
			//sonido mal
		}
		else if (percentage >= 20 && percentage < 40)
		{
			//sonido 1
		}
		else if (percentage >= 40 && percentage < 50)
		{
			//sonido 2
		}
		else if (percentage >= 50 && percentage < 60)
		{
			//otra pista
		}
		else if (percentage >= 60 && percentage < 70)
		{
			//otra pista
		}
		else if (percentage >= 70 && percentage < 80)
		{
			//otra pista
		}
		else if (percentage >= 80 && percentage < 90)
		{
			//otra pista
		}
		else if (percentage >= 90 && percentage < 100)
		{
			//otra pista
		}
		
	}
		
}