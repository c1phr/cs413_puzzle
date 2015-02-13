import Math.sqrt;
import Math.abs;
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
    public var door1:Image;
    public var door2:Image;
    public var door3:Image;
    public var door4:Image;
    public var door5:Image;
    public var door6:Image;
    public var door7:Image;
    public var door8:Image;
    public var lights:Image;
    
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
               
                door1 = new Image(Root.assets.getTexture("door_closed"));
                addChild(door1);
                door1.x = 287;
                door1.y = 283;
                door1.pivotX = 0;
                door1.pivotY = door1.texture.height/2;

                door2 = new Image(Root.assets.getTexture("door_closed"));
                addChild(door2);
                door2.x = 127;
                door2.y = 380;
                door2.pivotX = 0;
                door2.pivotY = door2.texture.height/2;


                door3 = new Image(Root.assets.getTexture("door_closed"));
                addChild(door3);
                door3.x = 191;
                door3.y = 380;
                door3.pivotX = 0;
                door3.pivotY = door3.texture.height/2;


                door4 = new Image(Root.assets.getTexture("door_closed"));
                addChild(door4);
                door4.x = 495;
                door4.y = 380;
                door4.pivotX = 0;
                door4.pivotY = door4.texture.height/2;


                door5 = new Image(Root.assets.getTexture("door_closed"));
                addChild(door5);
                door5.x = 783;
                door5.y = 380;
                door5.pivotX = 0;
                door5.pivotY = door5.texture.height/2;


                door6 = new Image(Root.assets.getTexture("door_closed"));
                addChild(door6);
                door6.x = 1071;
                door6.y = 380;
                door6.pivotX = 0;
                door6.pivotY = door6.texture.height/2;


                door7 = new Image(Root.assets.getTexture("door_open"));
                addChild(door7);
                door7.x = 662;
                door7.y = 639;
                door7.pivotX = 0;
                door7.pivotY = door7.texture.height/2;


                door8 = new Image(Root.assets.getTexture("door_open"));
                addChild(door8);
                door8.x = 917;
                door8.y = 639;
                door8.pivotX = 0;
                door8.pivotY = door8.texture.height/2;

                lights = new Image(Root.assets.getTexture("lights"));
                addChild(lights);
                lights.x = 640;
                lights.y = 15;

                Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, 
                	function(event:KeyboardEvent){
                		
                		//var c:Int = Std.int(sqrt((dot.x * dot.x) + (dot.y * dot.y)));

                        var door1_distance:Int = Std.int(abs(sqrt((dot.x - door1.x)*(dot.x - door1.x) + (dot.y - door1.y)*(dot.y - door1.y))));
                        //trace(door1_distance);

                        var door2_distance:Int = Std.int(abs(sqrt((dot.x - door2.x)*(dot.x - door2.x) + (dot.y - door2.y)*(dot.y - door2.y))));

                        var door3_distance:Int = Std.int(abs(sqrt((dot.x - door3.x)*(dot.x - door3.x) + (dot.y - door3.y)*(dot.y - door3.y))));

                        var door4_distance:Int = Std.int(abs(sqrt((dot.x - door4.x)*(dot.x - door4.x) + (dot.y - door4.y)*(dot.y - door4.y))));

                        var door5_distance:Int = Std.int(abs(sqrt((dot.x - door5.x)*(dot.x - door5.x) + (dot.y - door5.y)*(dot.y - door5.y))));

                        var door6_distance:Int = Std.int(abs(sqrt((dot.x - door6.x)*(dot.x - door6.x) + (dot.y - door6.y)*(dot.y - door6.y))));

                        var door7_distance:Int = Std.int(abs(sqrt((dot.x - door7.x)*(dot.x - door7.x) + (dot.y - door7.y)*(dot.y - door7.y))));

                        var door8_distance:Int = Std.int(abs(sqrt((dot.x - door8.x)*(dot.x - door8.x) + (dot.y - door8.y)*(dot.y - door8.y))));

                        var key1_distance:Int = Std.int(abs(sqrt((dot.x - key1.x)*(dot.x - key1.x) + (dot.y - key1.y)*(dot.y - key1.y))));

                        var note1_distance:Int = Std.int(abs(sqrt((dot.x - note1.x)*(dot.x - note1.x) + (dot.y - note1.y)*(dot.y - note1.y))));

                        var lights_distance:Int = Std.int(abs(sqrt((dot.x - lights.x)*(dot.x - lights.x) + (dot.y - lights.y)*(dot.y - lights.y))));

                        var doorDistance:Int = 100;

                        if(door1_distance < doorDistance){
                        	if(event.keyCode == Keyboard.ENTER){
                        		door1.rotation = -1.75;
                                destroySprite(door1);
                        	}
                        }

                        if(door2_distance < doorDistance){
                        	if(event.keyCode == Keyboard.ENTER){
                        		door2.rotation = -1.5;
                                destroySprite(door2);                                
                        	}
                        }

                        if(door3_distance < doorDistance){
                        	if(event.keyCode == Keyboard.ENTER){
                        		door3.rotation = -1.5;
                                destroySprite(door3);                                
                        	}
                        }

                        if(door4_distance < doorDistance){
                        	if(event.keyCode == Keyboard.ENTER){
                        		door4.rotation = -1.5;
                                destroySprite(door4);                                
                        	}
                        }

                        if(door5_distance < doorDistance){
                        	if(event.keyCode == Keyboard.ENTER){
                        		door5.rotation = -1.5;
                                destroySprite(door5);                                
                        	}
                        }

                        if(door6_distance < doorDistance){
                        	if(event.keyCode == Keyboard.ENTER){
                        		door6.rotation = -1.5;
                                destroySprite(door6);                                
                        	}
                        }

                        if(door7_distance < doorDistance){
                        	if(event.keyCode == Keyboard.ENTER){
                        		door7.rotation = -1.5;
                                destroySprite(door7);                                
                        	}
                        }

                        if(door8_distance < doorDistance){
                        	if(event.keyCode == Keyboard.ENTER){
                        		door8.rotation = -1.5;
                                destroySprite(door8);                                
                        	}
                        }

                        if(key1_distance < 50){
                        	if(event.keyCode == Keyboard.ENTER){
                        		key1.visible = false;
                        	}
                        }

                        if(note1_distance < 50){
                        	if(event.keyCode == Keyboard.ENTER){
                                var endGame = new EndGame(false, "note", rootSprite);
                                rootSprite.addChild(endGame);
                                this.removeFromParent();
                                this.dispose();                        		
                        	}
                        }
                	
                        if(lights_distance < 50){
                        	if(event.keyCode == Keyboard.ENTER){
                        		dark.visible = false;
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

                            if(checkCollision(dot, door1)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door2)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door3)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door4)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door5)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door6)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door7)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door8)){
                            	dot.x += 10;
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
<<<<<<< HEAD
                                    Root.assets.playSound("wall_collision");
                                }

=======
                                }	
>>>>>>> b536b88bd21ba1529efed1b282d056d34cbb5273
                                
                            }

                            if(checkCollision(dot, door1)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door2)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door3)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door4)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door5)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door6)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door7)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door8)){
                            	dot.x += 10;
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

                            if(checkCollision(dot, door1)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door2)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door3)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door4)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door5)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door6)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door7)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door8)){
                            	dot.x += 10;
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

                            if(checkCollision(dot, door1)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door2)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door3)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door4)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door5)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door6)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door7)){
                            	dot.x += 10;
                            }

                            if(checkCollision(dot, door8)){
                            	dot.x += 10;
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

    private function destroySprite(sprite:Image)
    {
        sprite.x = 10000;
        sprite.y = 10000;
        sprite.removeFromParent();        
        sprite.dispose();
        sprite = null;
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