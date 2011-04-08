package sisa.com.br.entidade;

import java.util.HashSet;
import java.util.Set;

public class Loteamento {
	
	private String nu_lotm;
	private String ds_lotm;
	private Set<Lote> lotes = new HashSet<Lote>();
		
	public Loteamento(){
		
	}
	
	public Loteamento(String pCodigo,String pNome){
		this.nu_lotm = pCodigo;
		this.ds_lotm = pNome;
	}

	public String getNu_lotm() {
		return nu_lotm;
	}

	public void setNu_lotm(String nu_lotm) {
		this.nu_lotm = nu_lotm;
	}

	public String getDs_lotm() {
		return ds_lotm;
	}

	public void setDs_lotm(String ds_lotm) {
		this.ds_lotm = ds_lotm;
	}
	
	public Set<Lote> getLotes() {
		return lotes;
	}
	public void setLotes(Set<Lote> lotes) {
		this.lotes = lotes;
	} 

}
