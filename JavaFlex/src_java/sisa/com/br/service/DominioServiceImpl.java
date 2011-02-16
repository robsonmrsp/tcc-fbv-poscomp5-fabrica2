package sisa.com.br.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


@Service(value="dominioService")
@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
public class DominioServiceImpl implements DominioService {
	
	public List< String> listarTipoSexo() {
		
		List<String> sexo = new ArrayList<String>();
		sexo.add("M");
		sexo.add("F");
		
		return sexo;
		
	}

	

	
}
