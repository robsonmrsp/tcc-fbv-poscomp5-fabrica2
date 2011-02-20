package sisa.com.br.relatorios.web;

import java.util.Collection;
import java.util.Map;

/**
 * Classe responsável por armazenar as informações referente ao relatório.
 * 
 * @author Clayton.Magalh�es (clayton.magalhaes@mv.com.br)
 * @since 27/04/2010
 */
public class InformacaoRelatorio {
	private String identicacaoRelatorio;

	private Collection<? extends Object> colecaoParaImprimir;

	private Map<String, Object> mapaParametros;

	/**
	 * @return O identicacaoRelatorio a ser recuperado.
	 */
	public String getIdenticacaoRelatorio() {
		return identicacaoRelatorio;
	}

	/**
	 * @param identicacaoRelatorio
	 *            O valor a ser atribuido em identicacaoRelatorio.
	 */
	public void setIdenticacaoRelatorio(String identicacaoRelatorio) {
		this.identicacaoRelatorio = identicacaoRelatorio;
	}

	/**
	 * @return O colecaoParaImprimir a ser recuperado.
	 */
	public Collection<? extends Object> getColecaoParaImprimir() {
		return colecaoParaImprimir;
	}

	/**
	 * @param colecaoParaImprimir
	 *            O valor a ser atribuido em colecaoParaImprimir.
	 */
	public void setColecaoParaImprimir(
			Collection<? extends Object> colecaoParaImprimir) {
		this.colecaoParaImprimir = colecaoParaImprimir;
	}

	/**
	 * @return O mapaParametros a ser recuperado.
	 */
	public Map<String, Object> getMapaParametros() {
		return mapaParametros;
	}

	/**
	 * @param mapaParametros
	 *            O valor a ser atribuido em mapaParametros.
	 */
	public void setMapaParametros(Map<String, Object> mapaParametros) {
		this.mapaParametros = mapaParametros;
	}

}
