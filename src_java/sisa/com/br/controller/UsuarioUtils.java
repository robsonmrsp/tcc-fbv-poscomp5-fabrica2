package sisa.com.br.controller;

import java.util.HashMap;


public class UsuarioUtils {

	//<Codigo Usuario, NomeEmpresa>
	public static HashMap<Integer, String> usuariosLogados = new HashMap<Integer, String>();
	
	public Boolean isUsuarioLogado(Integer codigoUsuario) {
		return usuariosLogados.containsKey(codigoUsuario);
	}
	
	public void retirarUsuarioLista(Integer codigoUsuario) {
		usuariosLogados.remove(codigoUsuario);
	}
}
