package sisa.com.br.entidade
{
	import sisa.com.br.TelasAdministracao.Transacao;
	

	[RemoteClass(alias="sisa.com.br.entidade.Transacao")]
	[Bindable]
	public class TransacaoSisa
	{
		public var id:Number;
		public var titulo:String;
		public var nome:String;
		public var url:String;
		public var ordem:Number;
		public var ativa:String;
		public var idPai:TransacaoSisa;
		public var transacao:TransacaoSisa;
	}
}