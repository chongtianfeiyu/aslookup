package eu.bartoszkrupa.aslookup.visitors
{
	import eu.bartoszkrupa.aslookup.ds.Tree;
	
	public class TreeVisitorFunction implements TreeVisitor
	{
		private var _visitorFunction:Function;
		public function TreeVisitorFunction(visitorFunction:Function)
		{
			this._visitorFunction=visitorFunction;
		}
		
		public function visit(tree:Tree):void
		{
			_visitorFunction(tree)
		}
	}
}