package sisa.com.br.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRException;
import sisa.com.br.relatorios.web.RelatorioProposta;

/**
 * Servlet implementation class ServletGeraRelatorios
 */
public class ServletGeraRelatorios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletGeraRelatorios() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dtIni = request.getParameter("dtini");
		String dtFim = request.getParameter("dtfim");
		String sit = request.getParameter("sit");
		String cdVend = request.getParameter("cdvend");
		//RelatorioProposta relatorioProposta = new RelatorioProposta("2011-01-01", "2011-01-01", "1", "1");
		RelatorioProposta relatorioProposta = new RelatorioProposta(dtIni, dtFim, sit, cdVend);
        try {
        	byte[] relatorio = relatorioProposta.gerar();
        	
        	if (relatorio != null && relatorio.length > 0) {  
                response.setContentType("application/pdf");  
                response.setContentLength(relatorio.length);  
                ServletOutputStream ouputStream = response.getOutputStream();  
                ouputStream.write(relatorio, 0, relatorio.length);  
                ouputStream.flush();  
                ouputStream.close();  
            }  
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
