package recruitment.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import recruitment.model.Area;

public interface AreaManager {
	public void add(Area area) throws Exception;
	public boolean delete(Area area)throws Exception;;
	public Area loadByAreaId(Area area) throws Exception;
	public boolean update(Area area) throws Exception;
	public List<Area> loadByCounty(Area area) throws Exception;
	public List<Area> loadByAreaName(Area area) throws Exception;
	public List<Area> listCountrys(Area area) throws Exception;
	public List<Area> listAreas(Area area) throws Exception;
	public List<Area> listIrelandCounties(Area area) throws Exception;
}
