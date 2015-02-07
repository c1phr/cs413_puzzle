

import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Image;
import starling.core.Starling;
import starling.animation.Transitions;
import starling.events.KeyboardEvent;
import flash.ui.Keyboard;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

class Root extends Sprite {



    public static var assets:AssetManager;
    public var dot:Image;
    
    
  	

    public function new() {
        super();
    }

    public function start(startup:Startup) {
    

        assets = new AssetManager();
	
		assets.enqueue("assets/dot.png");
		
        assets.loadQueue(function onProgress(ratio:Int) {
		
            if (ratio == 1) {
	
                Starling.juggler.tween(startup.loadingBitmap, 2.0, {
                    transition: Transitions.EASE_OUT,
                        delay: 1.0,
                        alpha: 0,
                        onComplete: function() {
                        startup.removeChild(startup.loadingBitmap);
                        
                    
						
                       
                        	dot = new Image(Root.assets.getTexture("dot"));
                       	 	addChild(dot);
                        	dot.x = 100;
                        	dot.y = 0;
                       
                        
                        Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, 
                        	function(event:KeyboardEvent){
                        		if(event.keyCode == Keyboard.LEFT){
                        			dot.x -= 10;
                        			}
                        		
                        		if(event.keyCode == Keyboard.RIGHT){
                        			dot.x += 10;
                        			}
                        		if(event.keyCode == Keyboard.UP){
                        			dot.y -= 10;
                        		}if(event.keyCode == Keyboard.DOWN){
                        			dot.y += 10;
                        		}
                        	});
                        	
                        

                        Starling.juggler.tween(dot, 1.0, {
                            transition: Transitions.EASE_OUT_BOUNCE,
                                delay: 2.0,
                                y: 250
                                });

                    }

                });
            }

        });
    }

}
