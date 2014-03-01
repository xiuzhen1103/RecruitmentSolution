package recruitment.service;

import java.util.List;

import recruitment.model.Area;
import recruitment.model.JobSeeker;

public interface AreaManager {
	public List<Area> getAreas()throws Exception;
	public abstract void add(Area area) throws Exception;
	public boolean delete(Integer areaId)throws Exception;;
	public Area loadByAreaId(Integer areaId) throws Exception;
	public boolean update(Integer areaId, String county, String area, String country, String latitude, String longitude) throws Exception;

}
