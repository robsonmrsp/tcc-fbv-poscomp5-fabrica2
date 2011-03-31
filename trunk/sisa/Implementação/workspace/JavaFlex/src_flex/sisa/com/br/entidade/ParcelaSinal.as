package sisa.com.br.entidade
{
	[RemoteClass(alias="sisa.com.br.entidade.ParcelaSinal")]
	[Bindable]
	public class ParcelaSinal
	{
		public var id: int;
		public var proposta: Proposta;
		public var parcela: int;
		public var tipoPagto: String;
		public var numeroDocumento: String;
		public var valor: Number;
		public var dataVencimento: Date;
	}
}