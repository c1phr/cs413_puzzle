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

	public function new(winState:Bool, loseType:String, rootSprite:Sprite)
	{
		super();
		this.rootSprite = rootSprite;
		var stage = Starling.current.stage;

		this.width = stage.stageWidth;
		this.height = stage.stageHeight;
		var background = new Quad(stage.stageWidth, stage.stageHeight, Color.BLACK);
		addChild(background);

		var endText:String;

		if (loseType == "note")
		{
			endText = "You begin to read the note but feel the air grow cold around you, you hear a creak and begin falling...";
		}
		else if (loseType == "win")
		{
			endText = "The button on the wall begins glowing ominously as you approach, you press it and the walls begin to fall away...\n\n"
			+ "... it was all just a game\n";
		}
		else if (loseType == "noKeys")
		{
			endText = "The button on the wall is as cold and lifeless as the room around you. You decide to press it, but nothing happens."
			+ " You start to hear laughing in the distance that saps the energy from your body.\n";
		}
		else
		{
			endText = "";
		}

		if (winState)
		{
			endText += "\nYou Win!";
		}
		else
		{
			endText += "\nYou Lose!";
		}

		var endGameTextField:TextField = new TextField(stage.stageWidth, 400, endText, "title_font", 50, Color.WHITE);
		endGameTextField.x = 0;
		endGameTextField.y = Std.int(stage.stageHeight/4);
		addChild(endGameTextField);

		var backButton = new TextField(400, 100, "Main Menu", "title_font", 72, Color.WHITE);
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