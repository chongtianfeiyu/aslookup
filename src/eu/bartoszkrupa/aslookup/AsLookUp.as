package eu.bartoszkrupa.aslookup
{
	import eu.bartoszkrupa.aslookup.ds.NullPredicate;
	import eu.bartoszkrupa.aslookup.ds.Tree;
	import eu.bartoszkrupa.aslookup.visitors.TreeVisitorFunction;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;
	
	public class AsLookUp
	{
		static public function walkFiltered(object:DisplayObjectContainer, interestedInClassesArray:Array=null):Tree {
			
			var tree:Tree = toTree(object)
			
			if(interestedInClassesArray){
				var treeVisitorFunction:TreeVisitorFunction = new TreeVisitorFunction(function(tree:Tree):void {
					for each (var cls:Class in interestedInClassesArray) 
					{
						if(tree.node is cls){
							return;
						}
					}
					tree.node=null;
				});
				tree.visit(treeVisitorFunction)
			}
			return tree.filter(new NullPredicate());
		}
		
		public static function toTree(object:DisplayObject):Tree
		{
			var tree:Tree = new Tree(object);
			if(object is DisplayObjectContainer) {
				var doc:DisplayObjectContainer = object as DisplayObjectContainer;
				for (var i:int = 0; i < doc.numChildren; i++) 
				{
					tree.children.push(toTree((doc.getChildAt(i))));
				}
			} 
			return tree;
		}
		
		public static function treeUnderPoint(object:DisplayObjectContainer, point:Point, interestedInClassesArray:Array=null):Array
		{
			trace("treeUnderPoint - not finished yet!")
			return object.getObjectsUnderPoint(point)
		}
		
		/**
		 *  
		 * @param object Root container to start from
		 * @param cls Class of the root and all children containers
		 * @param numChildrenFunction function accepting `obj:cls` type and returning `int`
		 * @param getChildAtFunction function accepting (`obj:cls`,`int`) and returning object
		 * 
		 */
		public static function toTreeAny(object:*, cls:Class, numChildrenFunction:Function, getChildAtFunction:Function):Tree
		{
			var tree:Tree = new Tree(object);
			if(object is cls) {
				var doc:* = object
				for (var i:int = 0; i < numChildrenFunction(doc); i++) 
				{
					tree.children.push(toTreeAny(getChildAtFunction(doc,i),cls,numChildrenFunction,getChildAtFunction));
				}
			} 
			return tree;
		}
	}
}