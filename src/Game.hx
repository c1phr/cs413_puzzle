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
            	dot.x = 815;
            	dot.y = 158;

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
        var wall1:Image;
        var wall2:Image;
        var wall3:Image;
        var wall4:Image;
        var wall5:Image;
        var wall6:Image;
        var wall7:Image;
        var wall8:Image;
        var wall9:Image;
        var wall10:Image;
        var wall11:Image;
        var wall12:Image;
        var wall13:Image;
        var wall14:Image;

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

        wall1 = new Image(Root.assets.getTexture("wall1"));
        addChild(wall1);
        wall1.x = 336;
        wall1.y = 16;
        wallsArray.add(wall1);

        wall2 = new Image(Root.assets.getTexture("wall2"));
        addChild(wall2);
        wall2.x = 16;
        wall2.y = 272;
        wallsArray.add(wall2);

        wall3 = new Image(Root.assets.getTexture("wall3"));
        addChild(wall3);
        wall3.x = 16;
        wall3.y = 368;
        wallsArray.add(wall3);

        wall4 = new Image(Root.assets.getTexture("wall4"));
        addChild(wall4);
        wall4.x = 176;
        wall4.y = 368;
        wallsArray.add(wall4);

        wall5 = new Image(Root.assets.getTexture("wall5"));
        addChild(wall5);
        wall5.x = 240;
        wall5.y = 368;
        wallsArray.add(wall5);

        wall6 = new Image(Root.assets.getTexture("wall6"));
        addChild(wall6);
        wall6.x = 544;
        wall6.y = 368;
        wallsArray.add(wall6);

        wall7 = new Image(Root.assets.getTexture("wall6")); //this wall and wall 6 are the same asset
        addChild(wall7);
        wall7.x = 832;
        wall7.y = 368;
        wallsArray.add(wall7);

        wall8 = new Image(Root.assets.getTexture("wall8"));
        addChild(wall8);
        wall8.x = 1120;
        wall8.y = 368;
        wallsArray.add(wall8);

        wall9 = new Image(Root.assets.getTexture("wall9"));
        addChild(wall9);
        wall9.x = 688;
        wall9.y = 528;
        wallsArray.add(wall9);

        wall10 = new Image(Root.assets.getTexture("wall10"));
        addChild(wall10);
        wall10.x = 672;
        wall10.y = 384;
        wallsArray.add(wall10);

        wall11 = new Image(Root.assets.getTexture("wall10")); // this wall and wall 10 are the same asset
        addChild(wall11);
        wall11.x = 928;
        wall11.y = 384;
        wallsArray.add(wall11);

        wall12 = new Image(Root.assets.getTexture("wall12"));
        addChild(wall12);
        wall12.x = 672;
        wall12.y = 662;
        wallsArray.add(wall12);

        wall13 = new Image(Root.assets.getTexture("wall12"));
        addChild(wall13);
        wall13.x = 928;
        wall13.y = 662;
        wallsArray.add(wall13);

        wall14 = new Image(Root.assets.getTexture("wall14"));
        addChild(wall14);
        wall14.x = 336;
        wall14.y = 384;
        wallsArray.add(wall14);
    }
}