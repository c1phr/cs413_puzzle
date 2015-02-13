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
	
		assets.enqueue("assets/dot.png");
		assets.enqueue("assets/floor2.png");
		assets.enqueue("assets/dark.png");
        assets.enqueue("assets/walls/eastWall.png");
        assets.enqueue("assets/walls/westWall.png");
        assets.enqueue("assets/walls/northWall.png");
        assets.enqueue("assets/walls/southWall.png");
        assets.enqueue("assets/title_font.png");
        assets.enqueue("assets/title_font.fnt");
        assets.enqueue("assets/key.png");
        assets.enqueue("assets/Notethumbnail.png");
        assets.enqueue("assets/walls/wall1.png");
        assets.enqueue("assets/walls/wall2.png");
        assets.enqueue("assets/walls/wall3.png");
        assets.enqueue("assets/walls/wall4.png");
        assets.enqueue("assets/walls/wall5.png");
        assets.enqueue("assets/walls/wall6.png");
        assets.enqueue("assets/walls/wall8.png");
        assets.enqueue("assets/walls/wall9.png");
        assets.enqueue("assets/walls/wall10.png");
        assets.enqueue("assets/walls/wall12.png");
        assets.enqueue("assets/walls/wall14.png");
		
        assets.loadQueue(function onProgress(ratio:Int) {
		
            if (ratio == 1) {
                startup.removeChild(startup.loadingBitmap);
	            // var game = new Game(this);
             //    game.startGame();
             //    this.addChild(game);
             var menu = new Menu(this);             
             this.addChild(menu);             
            }

        });
    }

}
