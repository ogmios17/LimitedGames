package Model.Utente;

import java.sql.SQLException;
import java.util.Collection;

public interface PagamentoDAOInterface {
	public void doSave(PagamentoBean pagamento)throws SQLException;
	public void doDelete(String numero)throws SQLException;
	public void doUpdate(PagamentoBean pagamento)throws SQLException;
	public PagamentoBean doRetrieveByKey(String numero)throws SQLException;
	public Collection<PagamentoBean> doRetrieveAll(String order)throws SQLException;
}
