package sisa.com.br.entidade
{
	[RemoteClass(alias="sisa.com.br.entidade.Promitente")]
	[Bindable]
	public class Promitente
	{
		public var codigo: String; 
		public var nome: String; 
		public var estadoCivil: String; 
		public var nomeConjuge: String; 
		public var sexo: String; 
		public var numeroRG: String; 
		public var orgaoEmissorRG: String; 
		public var dataExpedicaoRG: Date; 
		public var cpfCnpj: String; 
		public var dataNascimento: Date; 
		public var dependente: String; 
		public var telefoneResidencial: String; 
		public var enderecoCobranca: Endereco; 
		public var telefoneCobranca: String; 
		public var profissao: String; 
		public var situacao: String; 
		public var nacionalidade: String; 
		public var enderecoResidencial: Endereco; 
		public var nomeResponsavel: String; 
		public var cpfCnpjResponsavel: String;
		
	}
}