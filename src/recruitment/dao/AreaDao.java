package recruitment.dao;
import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.Area;

public interface AreaDao {
	public Area loadByAreaId(Integer areaId) throws DataAccessException;
	public boolean deleteArea(Integer areaId) throws DataAccessException;
	public void save(Area area) throws DataAccessException;
	public List<Area> listCountrys(Area area) throws DataAccessException;

	public List<Area> loadByAreaName(Area area) throws DataAccessException;
	public List<Area> loadByCounty(Area area) throws DataAccessException;
	public List<Area> getAreas(Area area) throws DataAccessException;
	public boolean updateArea(Integer areaId, String areaName, List<Area> area,
			String latitude, String longitude) throws DataAccessException;

	
}
