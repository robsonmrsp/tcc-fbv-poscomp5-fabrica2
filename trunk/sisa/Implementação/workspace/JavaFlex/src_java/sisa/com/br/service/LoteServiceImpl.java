package sisa.com.br.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import sisa.com.br.entidade.Lote;
import sisa.com.br.repositorio.LoteRepository;
import flex.messaging.FlexContext;

@Service(value = "loteService")
@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
public class LoteServiceImpl implements LoteService {

	private LoteRepository loteRepository;

	@Autowired
	public void setLoteRepository(LoteRepository loteRepository) {
		this.loteRepository = loteRepository;
	}

	public Lote save(Lote lote) throws Exception {
		try {

			System.out.println("teste");
			this.loteRepository.save(lote);
			return lote;
		} catch (Exception e) {
			throw new Exception("N‹o foi poss’vel salvar." + e.getCause());
		}
	}

	public Lote findById(Lote lote) throws Exception {
		try {
			return this.loteRepository.findById(lote);
		} catch (Exception e) {
			throw new Exception("N‹o foi poss’vel procurar pela ID."
					+ e.getMessage());
		}
	}

	public List<Lote> getList() throws Exception {
		try {
			return this.loteRepository.getList();
		} catch (Exception e) {
			throw new Exception("N‹o foi poss’vel listar." + e.getMessage());
		}
	}

	public void remove(Lote lote) throws Exception {
		try {
			this.loteRepository.remove(lote);
		} catch (Exception e) {
			throw new Exception("N‹o foi poss’vel excluir." + e.getMessage());
		}

	}

	public List<Lote> consultaLote(Lote lote) throws Exception {

		try {
			return this.loteRepository.consultaLote(lote);
		} catch (Exception e) {
			throw new Exception("N‹o foi poss’vel localizar." + e.getMessage());
		}
	}

	public Lote consultaLote(String numero) throws Exception {
		try {
			Lote loteLogado = null;
			loteLogado = this.loteRepository.consultaLote(numero);

			if (loteLogado == null) {
				throw new Exception("Usu‡rio ou senha incorreto");
			} else {
				// usu‡rio logado com sucesso
				// registro atributos na sess‹o
				FlexContext.getFlexClient().setAttribute("numero",
						loteLogado.getNumero());

				// retorno o objeto inteiro desse usu‡rio para ser armazenado no
				// Flex para consultas posteriores
				return loteLogado;
			}

		} catch (Exception e) {
			throw new Exception("Nï¿½o foi possï¿½vel procurar pela ID."
					+ e.getMessage());
		}
	}

	public void pingSessao() {

	}

}
