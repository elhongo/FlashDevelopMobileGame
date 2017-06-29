package;

import flixel.FlxGame;
import openfl.display.Sprite;
import openfl.Lib;
//import states.GameState;
import states.TitleState;


class Main extends Sprite 
{
	public function new()  
	{
		super();
		
		addChild(new FlxGame(800, 480, TitleState));

	}
}