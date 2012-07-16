package eu.bartoszkrupa.aslookup.ds
{
	public interface Predicate
	{
		function invoke(tree:Tree):Boolean;		
	}
}