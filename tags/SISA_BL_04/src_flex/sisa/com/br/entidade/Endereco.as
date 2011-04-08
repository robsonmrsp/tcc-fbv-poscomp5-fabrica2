package sisa.com.br.entidade
{
	[RemoteClass(alias="sisa.com.br.entidade.Endereco")]
	[Bindable]
	public class Endereco
	{
		public var codigo: Number; 
		public var cep: String;
		public var logradouro: String; 
		public var numero: String; 
		public var complemento: String; 
		public var bairro: String; 
		public var cidade: String; 		
		public var uf: String; 
	}
}