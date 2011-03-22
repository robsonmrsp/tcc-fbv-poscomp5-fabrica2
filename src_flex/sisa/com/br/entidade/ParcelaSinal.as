package sisa.com.br.entidade
{
	[RemoteClass(alias="sisa.com.br.entidade.ParcelaSinal")]
	[Bindable]
	public class ParcelaSinal
	{
		public var parcelaSinalPK: ParcelaSinalPK;
		public var tipoPagto: String;
		public var numeroDocumento: String;
		public var valor: Number;
		public var dataVencimento: Date;
		
		public function ParcelaSinal(pk: ParcelaSinalPK)
		{
			this.parcelaSinalPK = pk;
		}
	}
}