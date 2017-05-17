package states;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import gameObjects.Bullet;
import gameObjects.Circle;
import gameObjects.GlobalGameData.GGD;
import gameObjects.GameProgress.GP;
import gameObjects.SoundManager.SM;
import gameObjects.Gun;
import gameObjects.Fly1;
import gameObjects.Fly2;
import gameObjects.Player;
import gameObjects.Fly3;
import gameObjects.Fly;
import gameObjects.Energy;
import flixel.FlxSprite;
import openfl.Assets;

//import gameObjects.Wall;


class GameState extends FlxState
{
	var player:Player;
	//var wall:Wall;
	var bullets:FlxGroup;
	var flies1:FlxGroup;
	var flies3:FlxGroup;
	//var flies2:FlxGroup;
	var energies:FlxGroup;
	
	var circle:Circle;
	
	var xCenter: Float;
	var yCenter: Float;
	var radius: Float;
	
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
		xCenter = 370;
		yCenter = 215;
		radius = 200;
		circle = new Circle(xCenter, yCenter, radius);
		
		bullets = new FlxGroup();
		add(bullets);
		player = new Player(new Gun(bullets), xCenter - radius, yCenter, circle);
		
		add(player);
		GGD.player = player;
		GGD.circle = circle;
		
		flies1 = new FlxGroup();
		add(flies1);
		energies = new FlxGroup();
		add(energies);
		//for (i in 0...1) {
			flies1.add(new Fly1());
		//}
		for (i in 0...10) {
			energies.add(new Energy());
		}
		flies3 = new FlxGroup();
		add(flies3);
		for (i in 0...7) {
			flies3.add(new Fly3());
		}
		/*
		wall = new Wall(800, 100, 40, 600);
		add(wall);*/
		
		//FlxG.camera.target = player;
		FlxG.worldBounds.setSize(FlxG.camera.width, FlxG.camera.height);
		
		GP.setLevel(1);
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
		//FlxG.collide(player, wall);
		//FlxG.overlap(wall, bullets, wallVsBullets);
		/*FlxG.overlap(player, flies1, playerVsFly1);
		FlxG.overlap(bullets, flies1, bulletsVsFly1);
		FlxG.overlap(player, flies2, playerVsFly2);
		FlxG.overlap(bullets, flies2, bulletsVsFly2);
		FlxG.overlap(player, flies3, playerVsFly3);
		FlxG.overlap(bullets, flies3, bulletsVsFly3);*/
		
		FlxG.overlap(player, flies1, playerVsFly);
		FlxG.overlap(bullets, flies1, bulletsVsFly);
		FlxG.overlap(player, energies, playerVsEnergy);
		FlxG.overlap(bullets, energies, bulletsVsEnergy);
		FlxG.overlap(player, flies3, playerVsFly);
		FlxG.overlap(bullets, flies3, bulletsVsFly);
		
		text.text = "PROGRESS: " + GP.getPercentage() + "%";
		SM.checkTracks();
		super.update(elapsed);
	}
	/*
	function bulletsVsFly1(aBullet:Bullet,aFly1:Fly1)
	{
		aBullet.kill();
		aFly1.damage();
	}	
	function playerVsFly1(aPlayer:Player,aFly1:Fly1) 
	{
		//FlxG.switchState(new Death());
	}	
	function bulletsVsFly2(aBullet:Bullet,aFly2:Fly2)
	{
		aBullet.kill();
		aFly2.damage();
	}
	
	function playerVsFly2(aPlayer:Player,aFly2:Fly2) 
	{
		//FlxG.switchState(new Death());
	}	
	function bulletsVsFly3(aBullet:Bullet,aFly3:Fly3)
	{
		aBullet.kill();
		aFly3.damage();
	}	
	function playerVsFly3(aPlayer:Player,aFly3:Fly3) 
	{
		//FlxG.switchState(new Death());
	}
	*/
	/*
	function wallVsBullets(aWall:Wall,aBullet:Bullet) 
	{
		aBullet.kill();
	}*/
	
	
	function bulletsVsFly(aBullet:Bullet,aFly:Fly)
	{
		aBullet.kill();
		aFly.damage();
		//GP.killedFly();
	}
	
	function playerVsFly(aPlayer:Player,aFly:Fly) 
	{
		//FlxG.switchState(new Death());
		aFly.damage();
		GP.attackedByFly();
	}
	
	function bulletsVsEnergy(aBullet:Bullet,aEnergy:Energy)
	{
		//aBullet.kill();
		//aEnergy.damage();
	}
	
	function playerVsEnergy(aPlayer:Player,aEnergy:Energy) 
	{
		aEnergy.damage();
		GP.gotEnergy();
		SM.gotEnergySound();
	}
	
	override public function destroy():Void 
	{
		super.destroy();
		GGD.clear();
		GP.clear();
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