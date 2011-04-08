package sisa.com.br.entidade
{
	import mx.collections.ArrayCollection;
	
	[RemoteClass(alias="sisa.com.br.entidade.Loteamento")]
	[Bindable]
	public class LoteamentoSisa
	{
		public var nu_lotm:String;
		public var ds_lotm:String;
		public var loteamento:LoteamentoSisa;
		public var lotes:ArrayCollection;
	
	}
}
