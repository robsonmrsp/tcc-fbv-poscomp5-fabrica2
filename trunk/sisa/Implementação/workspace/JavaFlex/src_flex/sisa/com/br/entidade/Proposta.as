package sisa.com.br.entidade
{
	import mx.collections.ArrayCollection;
	
	[RemoteClass(alias="sisa.com.br.entidade.Proposta")]
	[Bindable]
	public class Proposta
	{
		public var numero: String;
		public var promitente: Promitente; 
		public var valorVista: Number; 
		public var valorSinal: Number; 
		public var financiamento: Financiamento; 
		public var observacao: String; 
		public var situacao: String; 
		public var vendedor: VendedorSisa; 
		public var dataEmissao: Date; 
		public var dataPrimeiraParcela: Date; 
		public var valorParcela: Number; 
		public var pagamentoVista: String;  //S: Sim - N: Não
		public var loteamento: LoteamentoSisa;
		public var lotes: ArrayCollection;	
		public var parcelasSinal: ArrayCollection;
	}
}