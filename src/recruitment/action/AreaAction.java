package recruitment.action;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import recruitment.model.Area;
import recruitment.service.AreaManager;
import recruitment.service.DbDao;

@Component("area")
@Scope("prototype")
public class AreaAction {
	private Area area = new Area();
	private AreaManager am;
	private String message="";
	private List<Area> areas;
	
	private List<Area> areas0;
	private List<Area> areas1;
	private List<Area> areas2;
	
	private Area area0 = new Area();
	private Area area1 = new Area();
	
	private DbDao dbDao;

	public AreaManager getAm() {
		return am;
	}
	@Resource(name="areaManager")
	public void setAm(AreaManager am) {
		this.am = am;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	public Area getArea() {
		return area;
	}
	public void setArea(Area area) {
		this.area = area;
	}

	public List<Area> getAreas() {
		return areas;
	}
	public void setAreas(List<Area> areas) {
		this.areas = areas;
	}
	public String execute() throws Exception{
		
		Integer id = area.getParentArea().getAreaId();
		if (id != null && id > 0) {
			Area b = (Area) dbDao.get(Area.class, id);
			area.setParentArea(b);
			area.setLevel(b.getLevel() + 1);
		}
		else {
			area.setParentArea(null);
			area.setLevel(0);
		}
		
		am.add(area);
		return "success";
	}

	public String load() throws Exception{
		this.area = this.am.loadByAreaId(area);
		
		areas0 = new ArrayList<Area>();
		areas1 = new ArrayList<Area>();
		
		areas0.addAll(am.listCountrys(null));
		
		if (area.getLevel() == 2) {
			String hql = "from Area a where a.parentArea.areaId = " + area.getParentArea().getParentArea().getAreaId();
			List as = dbDao.searchAll(hql);
			areas1.addAll(as);
			
			area1 = area.getParentArea();
			area0 = area1.getParentArea();
		}
		else if (area.getLevel() == 1) {
			area0 = area.getParentArea();
		}
		
		return "load";
	}
	
	public String listCountry() throws Exception {
		List<Area> as = am.listCountrys(null);
		
		String s = "";
		for (Area a : as) {
			s += a.getAreaId() + "_" +a.getAreaName() + ",";
		}
		
		if (s.length() > 0) {
			s = s.substring(0, s.length() - 1);
		}
		
		try {
			ServletActionContext.getResponse().getWriter().print(s);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String listDistrict() {
		String hql = "from Area a where a.parentArea.areaId = " + area.getAreaId();
		List<Area> as = dbDao.searchAll(hql);
		
		String s = "";
		for (Area a : as) {
			s += a.getAreaId() + "_" +a.getAreaName() + ",";
		}
		
		if (s.length() > 0) {
			s = s.substring(0, s.length() - 1);
		}
		
		try {
			ServletActionContext.getResponse().getWriter().print(s);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String delete() throws Exception{
		boolean deleted = am.delete(area);
		if(deleted) {
			message="delete succeeded";
			return "success";
		}
		else {
			message = "delete failed, Employer id is not exist";
			return "fail";
		}
	}

	public String list() throws Exception {
		this.areas = am.listAreas(this.area);
		return "list";
	}
	

	public String update() throws Exception {
		
		Area a = (Area) dbDao.get(Area.class, area.getAreaId());
		a.setAreaName(area.getAreaName());
		Integer id = area.getParentArea().getAreaId();
		if (id != null && id > 0) {
			Area b = (Area) dbDao.get(Area.class, id);
			a.setParentArea(b);
			a.setLevel(b.getLevel() + 1);
		}
		else {
			a.setParentArea(null);
			a.setLevel(0);
		}
		
		dbDao.save(a);
		
		return "success";
	}
	public List<Area> getAreas0() {
		return areas0;
	}
	public void setAreas0(List<Area> areas0) {
		this.areas0 = areas0;
	}
	public List<Area> getAreas1() {
		return areas1;
	}
	public void setAreas1(List<Area> areas1) {
		this.areas1 = areas1;
	}
	public List<Area> getAreas2() {
		return areas2;
	}
	public void setAreas2(List<Area> areas2) {
		this.areas2 = areas2;
	}
	
	public DbDao getDbDao() {
		return dbDao;
	}
	
	@Resource
	public void setDbDao(DbDao dbDao) {
		this.dbDao = dbDao;
	}
	public Area getArea0() {
		return area0;
	}
	public void setArea0(Area area0) {
		this.area0 = area0;
	}
	public Area getArea1() {
		return area1;
	}
	public void setArea1(Area area1) {
		this.area1 = area1;
	}

}
