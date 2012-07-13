package tests
{	
	import eu.bartoszkrupa.aslookup.AsLookUp;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.utils.getDefinitionByName;
	
	public class Test1 extends Sprite
	{
		public function Test1()
		{
			super();
			
			with(addChild(new Sprite)){
				addChild(new Shape)
				addChild(new Sprite)	
			}
			
			with(addChild(new Sprite)){
				addChild(new MovieClip)
				with(addChild(new Sprite)){
					addChild(new Shape)
				}
			}
			
			trace(AsLookUp.walkFiltered(this,[Sprite]).toString())
		}
	}
}