package Model.Ordine;

import java.sql.SQLException;
import java.util.Collection;

public interface OrdineDAOInterface {

	public int doSave(OrdineBean ordine)throws SQLException;
	public void doDelete(int id)throws SQLException;
	public void doUpdate(OrdineBean ordine)throws SQLException;
	public OrdineBean doRetrieveByKey(int id)throws SQLException;
	public Collection<OrdineBean> doRetrieveByUsername(String username)throws SQLException;
	public Collection<OrdineBean> doRetrieveAll(String order)throws SQLException;
	
}
