package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import gameObjects.SoundManager.SM;
import flixel.ui.FlxButton;

class TutorialState extends FlxState
{

	public function new() 
	{
		super();
	}
	
	override public function create():Void 
	{
		super.create();
		var background: FlxSprite = new FlxSprite(0, 0, "img/Tutorial1.png");
		add(background);
		SM.Instantiate();
		SM.menuTrackSound();

	}
	
	
	
	override public function update(elapsed: Float):Void 
	{

		if (FlxG.keys.justPressed.ESCAPE){
			FlxG.switchState(new TitleState());
		}
		super.update(elapsed);
	}
	
}