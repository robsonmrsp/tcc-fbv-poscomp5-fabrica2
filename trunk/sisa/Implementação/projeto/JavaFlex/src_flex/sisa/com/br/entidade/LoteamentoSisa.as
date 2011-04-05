package sisa.com.br.entidade
{
	import sisa.com.br.TelaLoteamento.Loteamento;
	
	[RemoteClass(alias="sisa.com.br.entidade.Loteamento")]
	[Bindable]
	public class LoteamentoSisa
	{
		public var nu_lotm:String;
		public var ds_lotm:String;
		public var loteamento:LoteamentoSisa;
	
	}
}
