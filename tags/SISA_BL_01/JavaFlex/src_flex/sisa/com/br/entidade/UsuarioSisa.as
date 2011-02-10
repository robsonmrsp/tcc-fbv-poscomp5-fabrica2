// ActionScript file
package sisa.com.br.entidade
{
	import sisa.com.br.TelaUsuario.Usuario;
	
	/**
	 * Entidade Anexo
	 * 
	 * @author Guilherme Sjlender (guilherme.sjlender@mv.com.br)
	 * @since 02/03/2010
	 */
	[RemoteClass(alias="sisa.com.br.entidade.Usuario")]
	[Bindable]
	public class UsuarioSisa
	{
		public var id:Number;
		public var nome:String;
		public var login:String;
		public var senha:String;
		public var usuario:UsuarioSisa;
	}
}
