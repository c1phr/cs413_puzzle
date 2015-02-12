import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Image;
import starling.core.Starling;
import starling.animation.Transitions;
import starling.events.KeyboardEvent;
import flash.ui.Keyboard;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.utils.RectangleUtil;


class Root extends Sprite {
    public static var assets:AssetManager;
    
    
    public function new() {
        super();
    }

    public function start(startup:Startup) {
        assets = new AssetManager();
	
		assets.enqueue("assets/dot2.png");
		assets.enqueue("assets/floor2.png");
		assets.enqueue("assets/walls.png");
		assets.enqueue("assets/dark.png");
        assets.enqueue("assets/eastWall.png");
        assets.enqueue("assets/westWall.png");
        assets.enqueue("assets/northWall.png");
        assets.enqueue("assets/southWall.png");
        assets.enqueue("assets/wall1.png");
        
		
        assets.loadQueue(function onProgress(ratio:Int) {
		
            if (ratio == 1) {
                startup.removeChild(startup.loadingBitmap);
	            var game = new Game(this);
                game.startGame();
                this.addChild(game);
            }

        });
    }



}
