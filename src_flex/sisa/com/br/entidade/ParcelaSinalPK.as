package sisa.com.br.entidade
{
	[RemoteClass(alias="sisa.com.br.entidade.ParcelaSinalPK")]
	[Bindable]
	public class ParcelaSinalPK
	{
		public var proposta: Proposta;
		public var parcela: int;
		
		public function ParcelaSinalPK(proposta: Proposta, parcela: int)
		{
			this.proposta = proposta;
			this.parcela = parcela;
		}

	}
}