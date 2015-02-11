

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
    public var dot:Image;
    public var floor1:Image;
    public var walls:Image;
    public var dark:Image; 
    
    
    public function new() {
        super();
    }

    public function start(startup:Startup) {
    
		
		
		
		
        assets = new AssetManager();
	
		assets.enqueue("assets/dot.png");
		assets.enqueue("assets/floor1.png");
		assets.enqueue("assets/walls.png");
		assets.enqueue("assets/dark.png");
		
        assets.loadQueue(function onProgress(ratio:Int) {
		
            if (ratio == 1) {
	
                Starling.juggler.tween(startup.loadingBitmap, 2.0, {
                    transition: Transitions.EASE_OUT,
                        delay: 1.0,
                        alpha: 0,
                        onComplete: function() {
                        startup.removeChild(startup.loadingBitmap);
                        
                    
                    	floor1 = new Image(Root.assets.getTexture("floor1"));
                    	addChild(floor1);
                    	
                    	
                    	
                    	walls = new Image(Root.assets.getTexture("walls"));
                    	addChild(walls);
						
                       
                        	dot = new Image(Root.assets.getTexture("dot"));
                       	 	addChild(dot);
                        	dot.x = 300;
                        	dot.y = 200;
                        	
                        	
                        	
                    //  dark = new Image(Root.assets.getTexture("dark"));
                        //	addChild(dark);
                        //	dark.y=-375;
                        //	dark.x=-720;
                       
                        Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, 
                        	function(event:KeyboardEvent){
                        		
                        	
                        		if(event.keyCode == Keyboard.LEFT){
                        		
                        			dot.x -= 10;
                        			dark.x -=10;
                        		}
                        		
                        		if(event.keyCode == Keyboard.RIGHT){
                        			dot.x += 10;
                        			dark.x +=10;
                        			}
                        		if(event.keyCode == Keyboard.UP){
                        			dot.y -= 10;
                        			dark.y -=10;
                        		}if(event.keyCode == Keyboard.DOWN){
                        			dot.y += 10;
                        			dark.y +=10;
                        		}
                        		if(dot.x == walls.y+590){
                        			dot.x = dot.x-10;
                        		//	dark.x = dark.x-10;
                        		}if(dot.x == walls.y-20){
                        			dot.x = dot.x+10;
                        			//dark.x = dark.x+10;
                        		}if(dot.y == walls.x-10){
                        			dot.y = dot.y+10;
                        			//dark.y = dark.y+10;
                        		}if(dot.y == walls.y+320){
                        			dot.y = dot.y -10;
                        			//dark.y = dark.y-10;
                        		}
                        	
                        		
                        		
                        	});
                        	
                        	dot.addEventListener(TouchEvent.TOUCH, 
                        	function(e:TouchEvent){
                        		var touch = e.getTouch(stage, TouchPhase.BEGAN);
                        	}); 
                        


                    }

                });
            }

        });
    }

}
