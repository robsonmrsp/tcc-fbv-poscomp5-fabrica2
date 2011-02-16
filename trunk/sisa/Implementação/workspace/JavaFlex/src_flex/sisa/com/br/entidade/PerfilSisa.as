package sisa.com.br.entidade
{
	import mx.collections.ArrayCollection;
	

	[RemoteClass(alias="sisa.com.br.entidade.Perfil")]
	[Bindable]
	public class PerfilSisa
	{
		public var id:Number;
		public var descricao:String;
		public var perfil:PerfilSisa;
		public var listaTransacao:ArrayCollection;
	}
}