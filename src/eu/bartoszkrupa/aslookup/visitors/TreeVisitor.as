package eu.bartoszkrupa.aslookup.visitors
{
	import eu.bartoszkrupa.aslookup.ds.Tree;

	public interface TreeVisitor
	{
		function visit(tree:Tree):void;
	}
}