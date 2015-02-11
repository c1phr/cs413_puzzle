

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
    public var floor1:Image;
    public var walls:Image;
    
    
  	

    public function new() {
        super();
    }

    public function start(startup:Startup) {
    

        assets = new AssetManager();
	
		assets.enqueue("assets/dot.png");
		assets.enqueue("assets/floor1.png");
		assets.enqueue("assets/walls.png");
		
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
                        	dot.x = 500;
                        	dot.y = 0;
                        	
                      
                        
                        Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, 
                        	function(event:KeyboardEvent){
                        	if(dot == walls){
                        			dot.x = 0;
                        			
                        				}
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
                        	walls.addEventListener(TouchEvent.TOUCH, 
                        	function(e:TouchEvent){
                        		var touch = e.getTouch(stage, TouchPhase.BEGAN);
                        		
                        		trace("NINJA TOUCHED");
                        		
                        		
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