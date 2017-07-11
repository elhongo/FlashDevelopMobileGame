package states;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
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
	var selectedLevel: Int;
	
	public function new(levelnumber: Int) 
	{
		selectedLevel = levelnumber;
		super();
	}
	override function create():Void
	{
		
		
		
		LVL.setLevel(selectedLevel);
		LVL.setUpLevel();
		
		if (selectedLevel == 1){
			background = new FlxSprite(0, 0, "img/FondoNivel1.png");
		}else if (selectedLevel == 2){
			background = new FlxSprite(0, 0, "img/FondoNivel2.png");
		}else if (selectedLevel == 3){
			background = new FlxSprite(0, 0, "img/FondoNivel3.png");
		}else if (selectedLevel == 4){
			background = new FlxSprite(0, 0, "img/FondoNivel4.png");
		}else if (selectedLevel == 5){
			background = new FlxSprite(0, 0, "img/FondoNivel5.png");
		}
		
		
		add(background);
		
		score = new FlxSprite(682, 0, "img/scoreSmall.png");
		add(score); 
		add(GGD.player);
		add(GGD.bullets);
		add(GGD.energies);
		add(GGD.fastEnergies);
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
		if (FlxG.keys.justPressed.ESCAPE){
			FlxG.switchState(new MenuState());
		}
	
		checkGameEnd();
		
		var camera:FlxCamera = FlxG.camera;
		FlxG.worldBounds.x = camera.scroll.x;
		FlxG.worldBounds.y = camera.scroll.y;

		FlxG.overlap(GGD.player, GGD.energies, COLL.playerVsEnergy);
		FlxG.overlap(GGD.bullets, GGD.energies, COLL.bulletsVsEnergy);
		FlxG.overlap(GGD.player, GGD.fastEnergies, COLL.playerVsFastEnergy);
		FlxG.overlap(GGD.bullets, GGD.fastEnergies, COLL.bulletsVsFastEnergy);
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