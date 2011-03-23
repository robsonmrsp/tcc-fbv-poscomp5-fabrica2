package sisa.com.br.entidade
{
	
	[RemoteClass(alias="sisa.com.br.entidade.Lote")]
	[Bindable]
	public class LoteSisa
	{
		public var cd_lote:Number;
		public var nu_lotm:String;
		public var nu_quadra:String;
		public var nu_lote:String;
		public var ds_conf_frente:String;
		public var ds_conf_fundo:String;
		public var ds_conf_direita:String;
		public var ds_conf_esquerda:String;
		public var nu_area:Number;
		public var nu_dist_esquina:Number;
		public var situacao:String;
		public var ds_dim_frente:String;
		public var ds_dim_fundo:String;
		public var ds_dim_direita:String;
		public var ds_dim_esquerda:String;
		public var valorm2:Number;
		public var lote:LoteSisa;

	}
}
