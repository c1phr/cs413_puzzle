import starling.display.Sprite;
import starling.text.TextField;
import starling.text.BitmapFont;
import starling.core.Starling;
import starling.utils.Color;
import starling.events.TouchEvent;
import starling.events.Touch;
import starling.events.TouchPhase;

class Menu extends Sprite {	
	public var rootSprite:Sprite;

	public function new(rootSprite:Sprite)
	{
		super();
		this.rootSprite = rootSprite;			
		var stage = Starling.current.stage;
		var title:TextField = new TextField(stage.stageWidth, 400, "The Room", "title_font", 128, Color.WHITE);
		title.x = 0;
		title.y = -100;
		addChild(title);

		var startGameButton = new TextField(400, 100, "Start Game", "title_font", 72, Color.WHITE);
		startGameButton.x = Std.int(stage.stageWidth/2) - 200;
		startGameButton.y = 200;
		startGameButton.border = true;
		startGameButton.addEventListener(TouchEvent.TOUCH, startGame);

		addChild(startGameButton);

		var tutorialButton = new TextField(400, 100, "Tutorial", "title_font", 72, Color.WHITE);
		tutorialButton.x = Std.int(stage.stageWidth/2) - 200;
		tutorialButton.y = 400;
		tutorialButton.border = true;
		tutorialButton.addEventListener(TouchEvent.TOUCH, openTutorial);

		addChild(tutorialButton);

		var creditsButton = new TextField(400, 100, "Credits", "title_font", 72, Color.WHITE);
		creditsButton.x = Std.int(stage.stageWidth/2) - 200;
		creditsButton.y = 600;
		creditsButton.border = true;
		creditsButton.addEventListener(TouchEvent.TOUCH, openCredits);

		addChild(creditsButton);


	}

	public function startGame(event:TouchEvent)
	{
		var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
		if (touch != null)
		{
			var game = new Game(rootSprite);
			rootSprite.addChild(game);
			game.startGame();
			this.removeFromParent();
			this.dispose();
		}
	}

	public function openCredits(event:TouchEvent)
	{
		var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
		if (touch != null)
		{
			var creditsScreen = new Credits();
			addChild(creditsScreen);
		}
	}

	public function openTutorial(event:TouchEvent)
	{
		var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
		if (touch != null)
		{
			var tutorialScreen = new Tutorial();
			addChild(tutorialScreen);
		}
	}
}