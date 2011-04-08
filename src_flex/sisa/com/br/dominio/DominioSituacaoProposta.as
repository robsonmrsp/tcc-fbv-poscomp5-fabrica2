package sisa.com.br.dominio
{
	import mx.collections.ArrayCollection;
	
	[RemoteClass(alias="sisa.com.br.dominio.DominioSituacaoProposta")]	
	[Bindable]
	public class DominioSituacaoProposta
	{
		public var codigo:String;
		public var descricao:String;
		public var getListaSituacoes:ArrayCollection;
	}
}