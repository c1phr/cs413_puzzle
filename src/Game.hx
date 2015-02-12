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

class Game extends Sprite
{
	var rootSprite:Sprite;	
	public var dot:Image;
    public var floor2:Image;
    public var walls:Image;
    public var dark:Image;
    public var wallsArray:List<Image>;
    public var key1:Image;
    public var note1:Image;
    
	public function new(rootSprite)
	{
		super();
		this.rootSprite = rootSprite;
	}

	public function startGame()
	{

                //startup.removeChild(startup.loadingBitmap);
                
            
            	floor2 = new Image(Root.assets.getTexture("floor2"));
            	addChild(floor2);

                addWalls();
               
            	dot = new Image(Root.assets.getTexture("dot"));
           	 	addChild(dot);
            	dot.x = 1280/2;
            	dot.y = 720/2;

                key1 = new Image(Root.assets.getTexture("key"));
                addChild(key1);
                key1.x = 500;
                key1.y = 300;

                note1 = new Image(Root.assets.getTexture("Notethumbnail"));
                addChild(note1);
                note1.x = 800;
                note1.y = 600;
                	
                dark = new Image(Root.assets.getTexture("dark"));
                	addChild(dark);
                	dark.y=0;
                	dark.x=0;
               
                Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, 
                	function(event:KeyboardEvent){
                		
                	
                		if(event.keyCode == Keyboard.LEFT){
                            dot.x -= 10;
                            //dark.x -=10;
                            for(wall in wallsArray)
                            {
                                if(checkCollision(dot, wall))
                                {
                                    dot.x += 10;
                                    //dark.x +=10;
                                }
                            }
                		}
                		if(event.keyCode == Keyboard.RIGHT){
                            dot.x += 10;
                            //dark.x +=10;
                            for(wall in wallsArray)
                            {
                                if(checkCollision(dot, wall))
                                {
                                    dot.x -= 10;
                                    //dark.x -=10;
                                }
                            }
                		}
                		if(event.keyCode == Keyboard.UP){
                            dot.y -= 10;
                            //dark.y -=10;
                            for(wall in wallsArray){
                                if(checkCollision(dot, wall))
                                {
                                    dot.y += 10;
                                    //dark.y +=10;
                                }
                            }
                            
                		}
                        if(event.keyCode == Keyboard.DOWN){
                            dot.y += 10;
                            //dark.y +=10;
                            for(wall in wallsArray)
                            {
                                if(checkCollision(dot, wall))
                                {
                                    dot.y -= 10;
                                    //dark.y -=10;
                                }
                            }
                		}

                		
                	
                		
                		
                	});
                	
                	dot.addEventListener(TouchEvent.TOUCH, 
                	function(e:TouchEvent){
                		var touch = e.getTouch(stage, TouchPhase.BEGAN);
                	}); 
                
	}

    private function checkCollision(texture1:Image, texture2:Image):Bool {
        return (texture1.bounds.intersects(texture2.bounds));
    }

    private function addWalls(){

        var eastWall:Image;
        var westWall:Image;
        var northWall:Image;
        var southWall:Image;

        wallsArray = new List<Image>();
        eastWall = new Image(Root.assets.getTexture("eastWall"));
        addChild(eastWall);
        eastWall.x = 1264;
        wallsArray.add(eastWall);

        westWall = new Image(Root.assets.getTexture("westWall"));
        addChild(westWall);
        wallsArray.add(westWall);

        northWall = new Image(Root.assets.getTexture("northWall"));
        addChild(northWall);
        wallsArray.add(northWall);

        southWall = new Image(Root.assets.getTexture("southWall"));
        addChild(southWall);
        southWall.y = 704;
        wallsArray.add(southWall);
    }
}