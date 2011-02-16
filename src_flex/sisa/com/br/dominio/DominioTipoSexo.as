package sisa.com.br.dominio
{
	import mx.collections.ArrayCollection;
	
	[RemoteClass(alias="sisa.com.br.dominio.DominioTipoSexo")]	
	[Bindable]
	public class DominioTipoSexo
	{
		
		public var masculino:String;
		public var feminino:String;
		public var getListaSexo:ArrayCollection;
	}
}