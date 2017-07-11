package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
import gameObjects.LevelSelectButton.ButtonMenu;
import gameObjects.SoundManager.SM;

class TitleState extends FlxState
{

	public function new() 
	{
		super();
	}
	
	override public function create():Void 
	{
		super.create();
		var background: FlxSprite = new FlxSprite(0, 0, "img/MainMenu.png");
		add(background);
		SM.Instantiate();
		SM.menuTrackSound();
		
		var butPlay:FlxButton = new FlxButton(0, 0, "", PlayGame);
		butPlay.loadGraphic("img/PlayButton.png");
		butPlay.setPosition(760, 610);
		
		var butTutorial:FlxButton = new FlxButton(0, 0, "", ShowTutorial);
		butTutorial.loadGraphic("img/ButtonTutorial.png");
		butTutorial.setPosition(760, 710);
		
		var butCredits:FlxButton = new FlxButton(0, 0, "", ShowCredits);
		butCredits.loadGraphic("img/CreditsButton.png");
		butCredits.setPosition(760, 810);
		
		add(butPlay);
		add(butTutorial);
		add(butCredits);
	}
	
	override public function update(elapsed: Float):Void 
	{
		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.switchState(new MenuState());
		}
		super.update(elapsed);
	}
	
	private function PlayGame():Void
	{
		FlxG.switchState(new MenuState());
	}
	private function ShowTutorial():Void
	{
		FlxG.switchState(new TutorialState());
	}
	private function ShowCredits():Void 
	{
		FlxG.switchState(new CreditsState());
	}
}