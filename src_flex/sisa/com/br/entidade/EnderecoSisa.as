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
	[RemoteClass(alias="sisa.com.br.entidade.Endereco")]
	[Bindable]
	public class EnderecoSisa
	{
		public var cd_endereco:int;
		public var nu_cep:String;
		public var ds_logradouro:String;
		public var nr_endereco:String;
		public var ds_complemento:String;
		public var ds_bairro:String;
		public var cd_uf:String;
		public var no_cidade:String;
		
		public var endereco:EnderecoSisa;
	}
}
