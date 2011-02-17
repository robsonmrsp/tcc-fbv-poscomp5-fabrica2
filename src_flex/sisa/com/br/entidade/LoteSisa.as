package sisa.com.br.entidade
{
	[RemoteClass(alias="sisa.com.br.entidade.Lote")]
	[Bindable]
	public class LoteSisa
	{
		public var numero:Number;
		public var quadra:String;
		public var confFrente:String;
		public var confFundo:String;
		public var confDireita:String;
		public var confEsquerda:String;
		public var area:Number;
		public var distanciaParaEsquina:Number;
		public var dimensaoFrente:String;
		public var dimensaoFundo:String;
		public var dimensaoDireita:String;
		public var dimensaoEsquerda:String;
		public var valorM2:Number;
		public var lote:LoteSisa;
	}
}