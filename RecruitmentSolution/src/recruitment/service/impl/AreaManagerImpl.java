package recruitment.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import recruitment.dao.AreaDao;
import recruitment.model.Area;
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
	public boolean delete(Area area) throws Exception {
		return areaDao.deleteArea(area.getAreaId());
	}

	@Override
	public List<Area> listCountrys(Area area) throws Exception {
		return areaDao.listCountrys(area);
	}

	@Override
	public Area loadByAreaId(Area area) throws Exception {
		return areaDao.loadByAreaId(area.getAreaId());
	}
	@Override
	public boolean update(Area area)throws Exception {
		return areaDao.updateArea(area.getAreaId(),area.getAreaName(), 
				area.getAreas(), area.getLatitude(), area.getLongitude());
	}
	/*
	@Override
	public List<Area> loadByAreaName(Area area) throws Exception {
		return areaDao.loadByAreaName(area);
	}
	@Override
	public List<Area> loadByCounty(Area area) throws Exception {
		// 
		return List<Area> areaDao.loadByCounty(area.getAreaId());
	}
	*/
	@Override
	public List<Area> loadByAreaName(Area area) throws Exception {
		// TODO Auto-generated method stub
		return  areaDao.loadByAreaName(area);
	}
	@Override
	public List<Area> loadByCounty(Area area) throws Exception {
		// TODO Auto-generated method stub
		return areaDao.loadByCounty(area);
	}
	@Override
	public List<Area> listAreas(Area area) throws Exception {
		// TODO Auto-generated method stub
		return areaDao.getAreas(area);
	}
	

}
