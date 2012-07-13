package eu.bartoszkrupa.aslookup.ds
{
	import eu.bartoszkrupa.aslookup.visitors.TreeVisitor;

	public class Tree
	{
		public var node:*;
		public var children:Vector.<Tree>=new Vector.<Tree>;
		public function Tree(node:*=null,children:Vector.<Tree>=null)
		{
			if(node)
				this.node=node;
			if(children)
				this.children=children;
		}
		
		public function visit(visitor:TreeVisitor):void
		{
			visitor.visit(this)
			for each (var child:Tree in children) 
			{
				child.visit(visitor)
			}
		}
		
		public function toString():String
		{
			return _toString()
		}
		
		private function _toString(tabulation:String=""){
			var _dumpString:String = "";
			_dumpString += tabulation + node + "\n";
			
			for each (var child:Tree in children) 
			{
				_dumpString+=child._toString(tabulation+"\t")
			}
			return _dumpString;
		}
	}
}