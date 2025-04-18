package Model.Gioco;

import java.sql.SQLException;
import java.util.Collection;

public interface StockDAOInterface {

	public Collection<StockBean> doRetrieveByGioco(int id) throws SQLException;
	public Collection<StockBean> doRetrieveByPiattaforma(String piattaforma) throws SQLException;
}
