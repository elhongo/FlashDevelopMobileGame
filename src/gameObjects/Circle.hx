package gameObjects;
import flixel.math.FlxMath;
import Math;

class Circle 
{

	var xCenter: Float;
	var yCenter: Float;
	var radius: Float;
	
	public function new(x: Float, y:Float, r:Float) 
	{
		xCenter = x;
		yCenter = y;
		radius = r;
	}
	
	public function getXCenter(): Float
	{
		return xCenter;
	}
	
	public function getYCenter(): Float
	{
		return yCenter;
	}
	
	public function getRadius(): Float
	{
		return radius;
	}
}