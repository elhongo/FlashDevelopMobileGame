package gameObjects;

import flixel.FlxG;
import flixel.FlxG.sound;
import flixel.system.FlxSound;


typedef SM = SoundManager;

class SoundManager 
{

	static var getEnergy:FlxSound;
	static var fire:FlxSound;
	static var track1:FlxSound;
	static var track2:FlxSound;
	static var track3:FlxSound;
	static var track4:FlxSound;
	static var track5:FlxSound;
	static var track6:FlxSound;
	static var trackMal1:FlxSound;
	static var trackMal2:FlxSound;
	static var menuTrack:FlxSound;
	static var startGame:FlxSound;
	static var killEnemy:FlxSound;
	
	public function new() 
	{
		//getEnergy = new FlxSound();
		//fire = new FlxSound();
		//getEnergy = FlxG.sound.load("sound/Agarrar esfera.wav");
		//fire = FlxG.sound.load("sound/Disparos.wav");
		//track1 = FlxG.sound.load("Sonido 5.wav");
		//track1.play(false, 0, null);
	}
	
	public static function Instantiate()
	{
		getEnergy = FlxG.sound.load("sound/Agarrar esfera.wav");
		fire = FlxG.sound.load("sound/Disparos.wav");
		menuTrack = FlxG.sound.load("sound/Sonido 1.wav");
		menuTrack.looped = true;
		startGame = FlxG.sound.load("sound/Comienzo nivel.wav");
		track1 = FlxG.sound.load("sound/Sonido 1.wav");
		track1.looped = true;
		track2 = FlxG.sound.load("sound/Sonido 2.wav");
		track2.looped = true;
		track3 = FlxG.sound.load("sound/Sonido 2.wav");
		track3.looped = true;
		track4 = FlxG.sound.load("sound/Sonido 4.wav");
		track4.looped = true;
		track5 = FlxG.sound.load("sound/Sonido 5.wav");
		track5.looped = true;
		track6 = FlxG.sound.load("sound/Sonido 6.wav");
		track6.looped = true;
		trackMal1 = FlxG.sound.load("sound/Sonido mal opcion I.wav");
		trackMal1.looped = true;
		trackMal2 = FlxG.sound.load("sound/Sonido mal opcion II.wav");
		trackMal2.looped = true;
		
		killEnemy = FlxG.sound.load("sound/MUEREenemigo.wav");
		killEnemy.looped = false;
		
		track1.play(false, 0.0, null);
		track2.play(false, 0.0, null);
		track3.play(false, 0.0, null);
		track4.play(false, 0.0, null);
		track5.play(false, 0.0, null);
		track6.play(false, 0.0, null);
		trackMal1.play(false, 0.0, null);
		trackMal2.play(false, 0.0, null);
		
	}


	public static function clear():Void
	{
		
	}
	
	public static function gotEnergySound()
	{
		getEnergy.play(true, 0.0, null);
	}
	
	public static function fireSound()
	{
		fire.play(true, 0.0, null);
	}
	
	public static function killSound()
	{
		killEnemy.play(true, 0.0, null);
	}
	
	public static function levelStartSound()
	{
		//sound.playMusic("sound/Comienzo nivel.wav", 20, false);
		menuTrack.stop();
		startGame.play();
	}
	public static function menuTrackSound(){
		menuTrack.play();
	}
	
	
	public static function checkTracks()
	{
		var percentage: Float = GameProgress.getPercentage();
		if (percentage < 20)
		{
			MuteTracks();
			trackMal2.volume = 1;			
		}
		else if (percentage >= 20 && percentage < 40)
		{
			MuteTracks();
			trackMal1.volume = 1;
		}
		else if (percentage >= 40 && percentage < 50)
		{
			MuteTracks();
			track6.volume = 1;
		}
		else if (percentage >= 50 && percentage < 60)
		{
			MuteTracks();
			track5.volume = 1;
		}
		else if (percentage >= 60 && percentage < 70)
		{
			MuteTracks();
			track4.volume = 1;
		}
		else if (percentage >= 70 && percentage < 80)
		{
			MuteTracks();
			track3.volume = 1;
		}
		else if (percentage >= 80 && percentage < 90)
		{
			MuteTracks();
			track2.volume = 1;
		}
		else if (percentage >= 90 && percentage < 100)
		{
			MuteTracks();
			track1.volume = 1;
		}
		
	}
	private static function MuteTracks(){
		track1.volume = 0;
		track2.volume = 0;
		track3.volume = 0;
		track4.volume = 0;
		track5.volume = 0;
		track6.volume = 0;
		trackMal1.volume = 0;
		trackMal2.volume = 0;
	}
		
}