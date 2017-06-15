package gameObjects;

typedef GP = GameProgress;

class GameProgress 
{

	private static var progress: Float;
	private static var initialProgress: Float;
	private static var finalProgress: Float;
	private static var playing: Bool;
	
	
	public function new() 
	{
		progress = 0;
		initialProgress = 0;
		finalProgress = 0;
		playing = false;
	}
	
	public static function clear():Void
	{
		progress = 0;
		initialProgress = 0;
		finalProgress = 0;
		playing = false;
	}
	
	public static function startGame()
	{
		progress = initialProgress;
		playing = true;
	}
	
	public static function getProgress(): Float
	{
		return progress;
	}
	
	public static function getPercentage(): Float
	{
		return (progress / finalProgress) * 100;
	}
	
	public static function setLevel(level: Int)
	{
		switch(level)
		{
			case 1:
				initialProgress = 50;
				finalProgress = 100;
			case 2:
				initialProgress = 20;
				finalProgress = 100;
			default:
				initialProgress = 200;
				finalProgress = 1000;
		}
	}
	
	public static function isComplete(): Bool
	{
		return progress >= finalProgress;
	}
	
	public static function isGameOver(): Bool
	{
		return progress <= 0;
	}
	
	public static function gotEnergy()
	{
		progress += 1;
	}
	
	public static function attackedByFly()
	{
		progress -= 1;
	}
}