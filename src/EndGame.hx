import starling.display.Sprite;
import starling.text.TextField;
import starling.text.BitmapFont;
import starling.core.Starling;
import starling.utils.Color;
import starling.events.TouchEvent;
import starling.events.Touch;
import starling.events.TouchPhase;
import starling.display.Quad;

// Useage:
// var endGame = new EndGame(*BOOL FOR WIN OR LOSE*, rootSprite);
// rootSprite.addChild(endGame);
// this.removeFromParent(); //Removes the game from the root
// this.dispose();
//

class EndGame extends Sprite {		
	public var rootSprite:Sprite;

	public function new(winState:Bool, rootSprite:Sprite)
	{
		super();
		this.rootSprite = rootSprite;
		var stage = Starling.current.stage;

		this.width = stage.stageWidth;
		this.height = stage.stageHeight;
		var background = new Quad(stage.stageWidth, stage.stageHeight, Color.BLACK);
		addChild(background);

		var endText:String;
		if (winState)
		{
			endText = "You Win!";
		}
		else
		{
			endText = "You Lose!";
		}

		var endGameTextField:TextField = new TextField(stage.stageWidth, 400, endText, "title_font", 96, Color.WHITE);
		endGameTextField.x = 0;
		endGameTextField.y = Std.int(stage.stageHeight/2);
		addChild(endGameTextField);

		var backButton = new TextField(400, 100, "Back To Menu", "title_font", 72, Color.WHITE);
		backButton.x = Std.int(stage.stageWidth/2) - 200;
		backButton.y = 600;
		backButton.border = true;
		backButton.addEventListener(TouchEvent.TOUCH, backToMenu);

		addChild(backButton);

	}

	public function backToMenu(event:TouchEvent)
	{
		var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
		if (touch != null)
		{
			var menu = new Menu(rootSprite);
			rootSprite.addChild(menu);
			this.removeFromParent();
			this.dispose();
		}
	}
}