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
        assets.enqueue("assets/title_font.fnt");

        assets.enqueue("assets/key_green.gif");
        assets.enqueue("assets/Notethumbnail.png");
        assets.enqueue("assets/door_open.png");
        assets.enqueue("assets/door_closed.png");
        assets.enqueue("assets/lights.png");

        assets.enqueue("packed_assets/atlas.xml");
        assets.enqueue("packed_assets/textures.png");
		
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
