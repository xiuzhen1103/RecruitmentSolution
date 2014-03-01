package recruitment.dao;
import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.Area;
import recruitment.model.JobSeeker;

public interface AreaDao {
	public Area loadByAreaId(Integer areaId) throws DataAccessException;
	public boolean deleteArea(Integer areaId) throws DataAccessException;
	public void save(Area area) throws DataAccessException;
	public List<Area> getAreas() throws DataAccessException;
	public boolean updateArea(Integer areaId, String county, String area, String country, String latitude, String longitude) throws DataAccessException;
}
