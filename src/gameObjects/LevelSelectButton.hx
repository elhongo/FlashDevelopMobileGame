package gameObjects;
import flash.display.Sprite;
import flash.text.TextField;
import flash.events.*;
  import flash.display.*;
  import flixel.util.FlxColor;



class ButtonMenu extends Sprite
{

	 public function ButtonMenu(  ) {
      var button:SimpleButton = new SimpleButton(  );
      button.x = 20;
      button.y = 20;
	  
      button.upState = createCircle(  15 );
      button.overState = createCircle( 16 );
      button.downState = createCircle(  15 );

      button.hitTestState = createCircle( 50 );
      
      button.addEventListener( MouseEvent.CLICK, handleClick );
      
      addChild( button );  
    }

	
	  private function createCircle(radius:Int ):Shape {
      var circle:Shape = new Shape(  );
      circle.graphics.lineStyle( 1, 0x000000 );
      circle.graphics.beginFill( 0x00FF00 );
      circle.graphics.drawCircle( 0, 0, radius );
      circle.graphics.endFill(  );
      return circle;
    }
	
	private function handleClick( event:MouseEvent ):Void {
     // trace( "Mouse clicked on the button" );  
    }
}