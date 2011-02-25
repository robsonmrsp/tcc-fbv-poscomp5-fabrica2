// ActionScript file
package sisa.com.br.entidade
{
	import sisa.com.br.TelaVendedor.Vendedor;
	
	/**
	 * Entidade Anexo
	 * 
	 * @author Guilherme Sjlender (guilherme.sjlender@mv.com.br)
	 * @since 02/03/2010
	 */
	[RemoteClass(alias="sisa.com.br.entidade.Vendedor")]
	[Bindable]
	public class VendedorSisa
	{
		public var cd_vend:String;
		public var ds_razao_nome:String;
		public var nu_fone:String;
		public var nu_cgc_cpf:String;
		public var no_fantasia:String;
		public var situacao:String;
		public var endereco:EnderecoSisa;
		public var vendedor:VendedorSisa;
	}
}
