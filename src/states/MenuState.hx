package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import gameObjects.SoundManager.SM;
import flixel.ui.FlxButton;

class MenuState extends FlxState
{

	public function new() 
	{
		super();
	}
	
	override public function create():Void 
	{
		super.create();
		var background: FlxSprite = new FlxSprite(0, 0, "img/LevelSelector.png");
		add(background);
		SM.Instantiate();
		SM.menuTrackSound();
		
		var butLevel1:FlxButton = new FlxButton(0, 0, "", SelectLevel1);
		butLevel1.loadGraphic("img/pozo1.png");
		butLevel1.setPosition(0, 335);
		add(butLevel1);
		
		var butLevel2:FlxButton = new FlxButton(0, 0, "", SelectLevel2);
		butLevel2.loadGraphic("img/pozo2.png");
		butLevel2.setPosition(378, 335);
		add(butLevel2);
		
		var butLevel3:FlxButton = new FlxButton(0, 0, "", SelectLevel3);
		butLevel3.loadGraphic("img/pozo3.png");
		butLevel3.setPosition(756, 335);
		add(butLevel3);
		
		var butLevel4:FlxButton = new FlxButton(0, 0, "", SelectLevel4);
		butLevel4.loadGraphic("img/pozo4.png");
		butLevel4.setPosition(1134, 335);
		add(butLevel4);
		
		var butLevel5:FlxButton = new FlxButton(0, 0, "", SelectLevel5);
		butLevel5.loadGraphic("img/pozo5.png");
		butLevel5.setPosition(1512, 335);
		add(butLevel5);
	}
	
	
	private function SelectLevel1():Void
	{
		FlxG.switchState(new GameState(1));
	}
	private function SelectLevel2():Void
	{
		FlxG.switchState(new GameState(2));
	}
	private function SelectLevel3():Void
	{
		FlxG.switchState(new GameState(3));
	}
		private function SelectLevel4():Void
	{
		FlxG.switchState(new GameState(4));
	}
	private function SelectLevel5():Void
	{
		FlxG.switchState(new GameState(5));
	}
	
	override public function update(elapsed: Float):Void 
	{
		if (FlxG.keys.justPressed.ONE)
		{
			
			FlxG.switchState(new GameState(1));
			
		}
		if (FlxG.keys.justPressed.TWO){
			FlxG.switchState(new GameState(2));
		}
		if (FlxG.keys.justPressed.THREE){
			FlxG.switchState(new GameState(3));
		}
		if (FlxG.keys.justPressed.FOUR){
			FlxG.switchState(new GameState(4));
		}
		if (FlxG.keys.justPressed.FIVE){
			FlxG.switchState(new GameState(5));
		}
		if (FlxG.keys.justPressed.ESCAPE){
			FlxG.switchState(new TitleState());
		}
		super.update(elapsed);
	}
	
}