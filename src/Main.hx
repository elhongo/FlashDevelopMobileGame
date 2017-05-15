package;

import flixel.FlxGame;
import openfl.display.Sprite;
import openfl.Lib;
import states.GameState;


class Main extends Sprite 
{
	public function new() 
	{
		super();
		
		// Assets:
		 //openfl.Assets.getBitmapData("img/Bueno.jpg");
		addChild(new FlxGame(800, 480, GameState));

	}
}