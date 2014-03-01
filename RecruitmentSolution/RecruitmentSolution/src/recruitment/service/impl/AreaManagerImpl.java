package recruitment.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Component;
import recruitment.dao.AreaDao;
import recruitment.model.Area;
import recruitment.model.JobSeeker;
import recruitment.service.AreaManager;
@Component("areaManager")
public class AreaManagerImpl implements AreaManager{
	
	private AreaDao areaDao;
	
	public AreaDao getAreaDao() {
		return areaDao;
	}
	@Resource
	public void setAreaDao(AreaDao areaDao) {
		this.areaDao = areaDao;
	}

	@Override
	public void add(Area area) throws Exception {
		areaDao.save(area);
		
	}

	@Override
	public boolean delete(Integer areaId) throws Exception {
		return areaDao.deleteArea(areaId);
	}

	@Override
	public List<Area> getAreas() throws Exception {
		
		return areaDao.getAreas();
	}

	@Override
	public Area loadByAreaId(Integer areaId) throws Exception {
		return areaDao.loadByAreaId(areaId);
	}
	@Override
	public boolean update(Integer areaId, String county, String area,
			String country, String latitude, String longitude)throws Exception {
		return areaDao.updateArea(areaId, county, area, country, latitude, longitude);
	}
	

}
