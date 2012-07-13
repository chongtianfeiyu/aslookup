package eu.bartoszkrupa.aslookup
{
	import eu.bartoszkrupa.aslookup.ds.Tree;
	import eu.bartoszkrupa.aslookup.visitors.TreeVisitorFunction;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;

	public class AsLookUp
	{
		static public function walkFiltered(object:DisplayObjectContainer, interestedInClassesArray:Array):Tree {
			
			var tree:Tree = toTree(object)
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
			return tree;
		}
		
		public static function toTree(object:DisplayObject):Tree
		{
			var tree:Tree = new Tree(object);
			if(object is DisplayObjectContainer){
				
				var doc:DisplayObjectContainer = object as DisplayObjectContainer;
				for (var i:int = 0; i < doc.numChildren; i++) 
				{
					tree.children.push(toTree((doc.getChildAt(i))));
				}
				
			} 
			return tree;
		}
	}
}