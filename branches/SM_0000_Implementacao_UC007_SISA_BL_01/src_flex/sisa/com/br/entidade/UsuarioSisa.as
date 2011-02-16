// ActionScript file
package sisa.com.br.entidade
{
	import mx.collections.ArrayCollection;
	import sisa.com.br.TelaUsuario.Usuario;
	

	[RemoteClass(alias="sisa.com.br.entidade.Usuario")]
	[Bindable]
	public class UsuarioSisa
	{
		public var id:Number;
		public var nome:String;
		public var login:String;
		public var senha:String;
		public var usuario:UsuarioSisa;
		public var listaPerfil:ArrayCollection;
	}
}
