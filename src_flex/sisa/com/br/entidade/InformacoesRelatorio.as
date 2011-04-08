package sisa.com.br.entidade
{
	
	[RemoteClass(alias="sisa.com.br.relatorios.web.InformacoesRelatorio")]
	[Bindable]	
	public class InformacoesRelatorio
	{
		public var identicacaoRelatorio:String;
		public var codigoRelatorio:Number;

		public function InformacoesRelatorio()
		{
		}

	}
}