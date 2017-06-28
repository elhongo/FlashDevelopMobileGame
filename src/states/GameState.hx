package states;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import gameObjects.GlobalGameData.GGD;
import gameObjects.GameProgress.GP;
import gameObjects.SoundManager.SM;
import gameObjects.Collisions.COLL;
import gameObjects.Level.LVL;
import flixel.FlxSprite;
import openfl.Assets;


class GameState extends FlxState
{
	
	var text:FlxText;
	var background:FlxSprite;
	var score:FlxSprite;
	
	public function new() 
	{
		super();
	}
	override function create():Void
	{
		
		background = new FlxSprite(0, 0, "img/Background.png");
		add(background);
		
		score = new FlxSprite(682, 0, "img/scoreSmall.png");
		add(score); 
		
		LVL.setLevel(1);
		LVL.setUpLevel();
	
		add(GGD.player);
		add(GGD.bullets);
		add(GGD.energies);
		add(GGD.normalFlies);
		add(GGD.homingFlies);
		
		FlxG.worldBounds.setSize(FlxG.camera.width, FlxG.camera.height);
		
		GP.startGame();
		
		text = new FlxText(300, 400, 0, "PROGRESS: " + GP.getPercentage() + "%", 10);
		add(text);
		

		SM.Instantiate();
		SM.levelStartSound();
	}
	override function update(elapsed: Float):Void
	{
		checkGameEnd();
		
		var camera:FlxCamera = FlxG.camera;
		FlxG.worldBounds.x = camera.scroll.x;
		FlxG.worldBounds.y = camera.scroll.y;

		FlxG.overlap(GGD.player, GGD.energies, COLL.playerVsEnergy);
		FlxG.overlap(GGD.bullets, GGD.energies, COLL.bulletsVsEnergy);
		FlxG.overlap(GGD.player, GGD.normalFlies, COLL.playerVsFly);
		FlxG.overlap(GGD.bullets, GGD.normalFlies, COLL.bulletsVsTarget);
		FlxG.overlap(GGD.player, GGD.homingFlies, COLL.playerVsFly);
		FlxG.overlap(GGD.bullets, GGD.homingFlies, COLL.bulletsVsTarget);
		
		text.text = "PROGRESS: " + GP.getPercentage() + "%";
		SM.checkTracks();
		super.update(elapsed);
	}
	
	override public function destroy():Void 
	{
		super.destroy();
		GGD.clear();
		GP.clear();
		SM.clear();
		LVL.clear();
		COLL.clear();
	}
	
	function checkGameEnd()
	{
		if (GP.isGameOver())
		{
			FlxG.switchState(new GameOver());
		}
		else if (GP.isComplete())
		{
			FlxG.switchState(new LevelComplete());
		}
	}
}