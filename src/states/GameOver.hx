package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;



class GameOver extends FlxState
{

	public function new() 
	{
		super();
	}
	override public function create():Void 
	{
		super.create();
		var background: FlxSprite = new FlxSprite(0, 0, "img/GAMEOVER800x400.png");
		add(background);
		
	}
	
	override public function update(elapsed: Float):Void 
	{
		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.switchState(new GameState());
		}
		super.update(elapsed);
	}
}