import Math.sqrt;
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
import starling.utils.MathUtil;

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

                key1 = new Image(Root.assets.getTexture("key_green"));
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
                		
                		var c:Int = Std.int(sqrt((dot.x * dot.x) + (dot.y * dot.y)));

                        var d:Int = Std.int(sqrt((key1.x * key1.x) + (key1.y * key1.y)));

                        var e:Int = d-c;
                        var f:Int = c-d;

                        if(e < 5 && f > -5){
                            if(event.keyCode == Keyboard.ENTER){
                            	key1.visible = false;
                            }
                        }
                	
                		if(event.keyCode == Keyboard.LEFT){
                            dot.x -= 10;
                            //dark.x -=10;
                            for(wall in wallsArray)
                            {
                            Root.assets.playSound("footstep");
                                if(checkCollision(dot, wall))
                                {
                                    dot.x += 10;
                                    //dark.x +=10;
                                    Root.assets.playSound("wall_collision");

                                }
                                if(checkCollision(dot, key1))
                                {
                                    dot.x += 10;
                                    //dark.x +=10;
                                    Root.assets.playSound("wall_collision");

                                }
                                if(checkCollision(dot, note1))
                                {
                                    dot.x += 10;
                                    //dark.x +=10;
                                    Root.assets.playSound("wall_collision");
                                }

                            }
                		}
                		if(event.keyCode == Keyboard.RIGHT){
                            dot.x += 10;
                            //dark.x +=10;
                            for(wall in wallsArray)
                            {

                            	Root.assets.playSound("footstep");

                                if(checkCollision(dot, wall))
                                {
                                    dot.x -= 10;
                                    //dark.x -=10;
                                    Root.assets.playSound("wall_collision");
                                }
                                if(checkCollision(dot, key1))
                                {
                                    dot.x += 10;
                                    //dark.x +=10;
                                    Root.assets.playSound("wall_collision");
                                }
                                if(checkCollision(dot, note1))
                                {
                                    dot.x += 10;
                                    //dark.x +=10;
                                    Root.assets.playSound("wall_collision");
                                }

                                
                            }
                		}
                		if(event.keyCode == Keyboard.UP){
                            dot.y -= 10;
                            //dark.y -=10;
                            for(wall in wallsArray){
                                Root.assets.playSound("footstep");   
                                if(checkCollision(dot, wall))
                                {
                                    dot.y += 10;
                                    //dark.y +=10;
                                    Root.assets.playSound("wall_collision");
                                }
                                if(checkCollision(dot, key1))
                                {
                                    dot.x += 10;
                                    //dark.x +=10;
                                    Root.assets.playSound("wall_collision");
                                }
                                if(checkCollision(dot, note1))
                                {
                                    dot.x += 10;
                                    //dark.x +=10;
                                    Root.assets.playSound("wall_collision");
                                }

                            }
                            
                		}
                        if(event.keyCode == Keyboard.DOWN){
                            dot.y += 10;
                            //dark.y +=10;
                            for(wall in wallsArray)
                            {
                            Root.assets.playSound("footstep");
                                if(checkCollision(dot, wall))
                                {
                                    dot.y -= 10;
                                    //dark.y -=10;
                                    Root.assets.playSound("wall_collision");
                                }
                                if(checkCollision(dot, key1))
                                {
                                    dot.x += 10;
                                    //dark.x +=10;
                                    Root.assets.playSound("wall_collision");
                                }
                                if(checkCollision(dot, note1))
                                {
                                    dot.x += 10;
                                    //dark.x +=10;
                                    Root.assets.playSound("wall_collision");
                                }
                            }
                		}

                		
                	
                		
                		
                	});
                	
                	dot.addEventListener(TouchEvent.TOUCH, 
                	function(e:TouchEvent){
                		var touch = e.getTouch(stage, TouchPhase.BEGAN);
                        Root.assets.playSound("item_pickup");
                	}); 
                
	}

    private function checkCollision(texture1:Image, texture2:Image):Bool {
        return (texture1.bounds.intersects(texture2.bounds));
    }

    private function addWalls(){

        var walls:List<InnerWall>;
        walls = new List<InnerWall>();

        var tempWall = new InnerWall("eastWall", "eastWall", 1264, 0);
        walls.add(tempWall);
        tempWall = new InnerWall("westWall", "westWall", 0, 0);
        walls.add(tempWall);
        tempWall = new InnerWall("northWall", "northWall", 0, 0);
        walls.add(tempWall);
        tempWall = new InnerWall("southWall", "southWall", 0, 704);
        walls.add(tempWall);

        tempWall = new InnerWall("wall1", "wall1", 336, 16);
        walls.add(tempWall);
        tempWall = new InnerWall("wall2", "wall2", 16, 272);
        walls.add(tempWall);
        tempWall = new InnerWall("wall3", "wall3", 16, 368);
        walls.add(tempWall);
        tempWall = new InnerWall("wall4", "wall4", 176, 368);
        walls.add(tempWall);
        tempWall = new InnerWall("wall5", "wall5", 240, 368);
        walls.add(tempWall);
        tempWall = new InnerWall("wall6", "wall6", 544, 368);
        walls.add(tempWall);
        tempWall = new InnerWall("wall7", "wall6", 832, 368);
        walls.add(tempWall);
        tempWall = new InnerWall("wall8", "wall8", 1120, 368);
        walls.add(tempWall);
        tempWall = new InnerWall("wall9", "wall9", 688, 528);
        walls.add(tempWall);
        tempWall = new InnerWall("wall10", "wall10", 672, 384);
        walls.add(tempWall);
        tempWall = new InnerWall("wall11", "wall10", 928, 384);
        walls.add(tempWall);
        tempWall = new InnerWall("wall12", "wall12", 672, 662);
        walls.add(tempWall);
        tempWall = new InnerWall("wall13", "wall12", 928, 662);
        walls.add(tempWall);
        tempWall = new InnerWall("wall14", "wall14", 336, 384);
        walls.add(tempWall);

        wallsArray = new List<Image>();

        var tempImage:Image;
        for(wall in walls) {
            tempImage = new Image(Root.assets.getTexture(wall.textureName));
            addChild(tempImage);
            tempImage.x = wall.x;
            tempImage.y = wall.y;
            wallsArray.add(tempImage);
        }
    }
}