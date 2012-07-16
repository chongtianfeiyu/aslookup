package eu.bartoszkrupa.aslookup.ds
{
	public class NullPredicate implements Predicate
	{
		public function invoke(tree:Tree):Boolean
		{
			return tree.node;
		}
	}
}