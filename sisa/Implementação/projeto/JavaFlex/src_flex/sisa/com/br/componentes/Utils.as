package sisa.com.br.componentes
{
	import mx.collections.ArrayCollection;
	import mx.containers.TitleWindow;
	import mx.controls.Alert;
	import mx.core.UIComponent;
	import mx.events.ValidationResultEvent;
	import mx.rpc.events.FaultEvent;
	import mx.validators.Validator;
	
	public class Utils
	{
		public static const millisecondsPerMinute:int = 1000 * 60;
		public static const millisecondsPerHour:int = 1000 * 60 * 60;
		public static const millisecondsPerDay:int = 1000 * 60 * 60 * 24;

		
		public function Utils()
		{
		}

		public static function validarForm(validacaoArr: Array): Boolean
		{
/* 			var validacaoArr: Array = new Array;
			
			//Procura por todos os objetos de validação
			for each (var child:UIComponent in tela.getChildren()) {
				if (child is Validator){
					Alert.show("Encontrou um Validator");
					validacaoArr.push(child);
				}
			} 
 */		    //esta variavel sera reponsável por armazenar os result dos erros
		    var errosArray:Array = Validator.validateAll(validacaoArr);
		    //verifica se o formulario é válido. Ele será válido se: todos os campos necessários forem preenchidos
		    var formValido:Boolean = errosArray.length == 0;
		    //caso verdadeiro
		    if (formValido){
		        //chama a função salvar
		        return true;
		    } else {
		        //caso falso, armazenar o erro na variavel 'erro'        
		        var erro:ValidationResultEvent;
		        var erroMensagem:Array = [];
		        for each (erro in errosArray){
		              //em cada campo que passar vai pegar o conteudo setado na propriedade FormItem do formulario
		            //var erroFieldFormItem:String = erro.currentTarget.source.parent.label;
		            //e vai inserir no array 'erroMensagem' o nome do campo(erroFieldFormItem) : a mensagem passada nos validados -> *1
		            erroMensagem.push("- " + erro.message);
		        }
		        var errorString: String = erroMensagem.join("\n\n");
		        
		        Alert.show(errorString);
		        
		        return false;
		    }
		}
		
		public static function mensagemErro(e: FaultEvent): String
		{
			var erro: String = e.fault.faultString;
			var pos: Number = erro.indexOf(":", 0) + 1;
			
			return erro.substring(pos);			
		}
		
        public static function dateAdd(datepart:String = "", number:Number = 0, date:Date = null):Date 
        {
            if (date == null) {
                /* Default to current date. */
                date = new Date();
            }
 
            var returnDate:Date = new Date(date.time);
 
            switch (datepart.toLowerCase()) {
                case "fullyear":
                case "month":
                case "date":
                case "hours":
                case "minutes":
                case "seconds":
                case "milliseconds":
                    returnDate[datepart] += number;
                    break;
                default:
                    /* Unknown date part, do nothing. */
                    break;
            }
            return returnDate;
        }
			
		public static function getIndexListaDominio(lista: ArrayCollection, valor: String): int{
			try{
				for ( var cont:int = 0; cont < lista.length; cont++ ) {
					if (lista[cont].codigo == valor) {
				      return cont;
				    }
				}
			}
			catch (e: Error){
				Alert.show(e.message);
			}
			return -1;
		}
			
		public static function getIndexLista(lista: ArrayCollection, propriedade: String, valor: String): int{
			for ( var cont:int = 0; cont < lista.length; cont++ ) {
				if (lista[cont][propriedade] == valor) {
			      return cont;
			    }
			  }
			  return -1;
		}
	}
}