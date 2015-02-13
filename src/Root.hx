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
        assets.enqueue("packed_assets/title_font.fnt");
        assets.enqueue("packed_assets/atlas.xml");
        assets.enqueue("packed_assets/textures.png");
        assets.enqueue("packed_assets/dark.png");
        assets.enqueue("packed_assets/solid_dark.png");
		
        assets.enqueue("assets/game_music.mp3");
        assets.enqueue("assets/footstep.mp3");
        assets.enqueue("assets/wall_collision.mp3");
        assets.enqueue("assets/item_pickup.mp3");

        assets.loadQueue(function onProgress(ratio:Int) {
		            assets.playSound("game_music");

            if (ratio == 1) {
                startup.removeChild(startup.loadingBitmap);	         
             var menu = new Menu(this);             
             this.addChild(menu);             
            }

        });
    }

}
