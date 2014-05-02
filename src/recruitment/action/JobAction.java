package recruitment.action;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import recruitment.model.Area;
import recruitment.model.CV;
import recruitment.model.Job;
import recruitment.model.JobSeeker;
import recruitment.model.JobSeekerSkill;
import recruitment.model.JobSkill;
import recruitment.model.Skill;
import recruitment.model.SkillCategory;
import recruitment.service.ApplyJobManager;
import recruitment.service.AreaManager;
import recruitment.service.JobManager;
import recruitment.service.SkillCategoryManager;
import recruitment.service.SkillManager;
import com.opensymphony.xwork2.ActionSupport;

@Component("job")
@Scope("prototype")
public class JobAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private JobManager jm;
	private List<Job> jobs;
	private Job job = new Job();
	private String message = "";
	private List<JobSeeker> listJobseekers;
	private List<CV> cs;
	private JobSeeker js;
	private List<Area> listCountys;
	private List<Area> listDistricts;
	private List<Area> listCountrys;
	private List<Area> listIrelandCountys;
	private AreaManager am;
	private Area area;
	private SkillCategory skillCategory;
	private SkillCategoryManager skillCategoryManager;
	private List<SkillCategory> listMainSkillCategorys;
	private List<SkillCategory> listSubSkillCategorys;
	private List<Skill> listSkill;
	private Skill skill;
	private SkillManager skillManager;
	private ApplyJobManager ajm;
	private static int flag =0;
	private List<Job> listJobSortByParam;
	private String sort;

	public JobManager getJm() {
		return jm;
	}

	@Resource(name = "jobManager")
	public void setJm(JobManager jm) {
		this.jm = jm;
	}

	public List<Job> getJobs() {
		return jobs;
	}

	public void setJobs(List<Job> jobs) {
		this.jobs = jobs;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String detail() throws Exception {
		job = jm.findById(job);
		if (null != js && null != js.getJsId()) {
			job.setIsApplied(ajm.isJobAppliedByJs(job.getJobId(), js.getJsId()));
		}
		return "detail";
	}
	
	public String plain_detail() throws Exception {
		job = jm.findById(job);
		if (null != js && null != js.getJsId()) {
			job.setIsApplied(ajm.isJobAppliedByJs(job.getJobId(), js.getJsId()));
		}
		return "plain_detail";
	}

	public String execute() throws Exception {
		
		jm.add(job);
		return "addJob_success";
	}

	public String registerJob() throws Exception {
		this.listMainSkillCategorys = skillCategoryManager.listMainSkillCategory(skillCategory);
		this.listCountrys = am.listCountrys(area);
		return "registerJob";
	}

	public String delete() throws Exception {
		boolean deleted = jm.delete(job);
		if (deleted) {
			message = "deleted succeeded ";
			return "success";
		}
		message = "deleted failed";
		return "fail";
	}

	public String list() throws Exception {
		this.listMainSkillCategorys = skillCategoryManager.listMainSkillCategory(skillCategory);
		this.listCountrys = am.listCountrys(area);
		this.jobs = jm.getJobs(this.job);
		return "list";
	}
	
	public String listForAdmin() throws Exception {
		this.listMainSkillCategorys = skillCategoryManager.listMainSkillCategory(skillCategory);
		this.listCountrys = am.listCountrys(area);
		this.jobs = jm.getJobsForAdmin(this.job);
		return "listForAdmin";
	}
	
	public String sortJob() throws Exception {
		this.listMainSkillCategorys = skillCategoryManager.listMainSkillCategory(skillCategory);
		this.listCountrys = am.listCountrys(area);
		if(flag%2==0) {
			this.jobs = jm.sortJobByAsc(sort);
			flag++;
		}
		else if(flag%2 != 0) {
			this.jobs = jm.sortJobByDesc(sort);
			flag++;
		}

		return "sortJob";
	}
	
	public String sortJobForAdmin() throws Exception {
		this.listMainSkillCategorys = skillCategoryManager.listMainSkillCategory(skillCategory);
		this.listCountrys = am.listCountrys(area);
		if(flag%2==0) {
			this.jobs = jm.sortJobByAsc(sort);
			flag++;
		}
		else if(flag%2 != 0) {
			this.jobs = jm.sortJobByDesc(sort);
			flag++;
		}

		return "sortJobForAdmin";
	}
	
	public List<Area> getIreland() throws Exception {
		
		return listIrelandCountys;
	}
	
	
	public String first() throws Exception {
		this.listMainSkillCategorys = skillCategoryManager.listMainSkillCategory(skillCategory);
		
		this.listCountrys = am.listCountrys(area);
		this.jobs = jm.getJobs(this.job);
		return "first";
	}
	
	public String first1() throws Exception {
		this.listMainSkillCategorys = skillCategoryManager.listMainSkillCategory(skillCategory);
		
		this.listCountrys = am.listCountrys(area);
		
		job.setJobCategory(skillCategory);
		job.setCountryId(area);
		this.jobs = jm.getJobs(this.job);
		return "first1";
	}

	public String listEmpJob() throws Exception {
		this.jobs = jm.getJobs(this.job);
		return "listEmpJob";
	}

	public String listCVByJsId() throws Exception {
		this.cs = jm.listCVByJsId(job, js);
		return "listCVByJsId";
	}

	public String logout() throws Exception {
		this.jobs = jm.getJobs(this.job);
		return "logout";
	}

	public String logged() throws Exception {
		this.listMainSkillCategorys = skillCategoryManager.listMainSkillCategory(skillCategory);
		this.listCountrys = am.listCountrys(area);

		// get job seeker skill
		List<Integer> jobSeekerSkills = new ArrayList<Integer>();
		JobSeeker jobSeeker = (JobSeeker)ServletActionContext.getRequest().getSession().getAttribute("jobSeeker");
		for (JobSeekerSkill skill : jobSeeker.getJobSeekerSkill()) {
			jobSeekerSkills.add(skill.getSkill().getSkillId());
		}
		this.job.setCheckboxes(jobSeekerSkills.toArray(new Integer[jobSeekerSkills.size()]));
		this.jobs = jm.getJobs(this.job);

		// sort
		final Map<Integer, Integer> sortMap = getJobSkillRate(jobs, jobSeekerSkills);
		Collections.sort(jobs, new Comparator<Job>() {
			@Override
			public int compare(Job a, Job b) {
				return sortMap.get(b.getJobId()) - sortMap.get(a.getJobId());
			}
		});

		for (Job job : jobs) {
			if (sortMap.get(job.getJobId()) > 1000) {
				job.setIsBestMatch(Boolean.TRUE);
			}
		}

		return "logged";
	}

	private Map<Integer, List<Integer>> mapJobSkillIds(List<Job> jobs) {
		Map<Integer, List<Integer>> map = new HashMap<Integer, List<Integer>>();
		for (Job job : jobs) {
			List<Integer> ids = new ArrayList<Integer>();
			for (JobSkill js : job.getJobSkills()) {
				ids.add(js.getSkill().getSkillId());
			}
			map.put(job.getJobId(), ids);
		}
		return map;
	}

	private Map<Integer, Integer> getJobSkillRate(List<Job> jobs, List<Integer> skillIds) {
		Map<Integer, Integer> countMap = new HashMap<Integer, Integer>();
		Map<Integer, List<Integer>> map =  mapJobSkillIds(jobs);
		for (Map.Entry<Integer, List<Integer>> p : map.entrySet()) {
			List<Integer> jSkillIds = p.getValue();
			int count = 0;
			for (Integer i : skillIds) {
				for (Integer j : jSkillIds) {
					
					if (i!= null && i.equals(j)) {
						count ++;
					}
				}
			}
			if (jSkillIds.size() == skillIds.size()) {
				count = count + 1000;
			}
			countMap.put(p.getKey(), count);
		}
		return countMap;
	}

	public String load() throws Exception {
		this.listMainSkillCategorys = skillCategoryManager.listMainSkillCategory(skillCategory);
		this.listCountrys = am.listCountrys(area);
		this.job = this.jm.loadById(job);
		return "load";
	}

	public String update() throws Exception {
		boolean updated = jm.update(job);
		if (updated) {
			message = "update succeeded ";
			return "success";
		}
		message = "update failed";
		return "fail";
	}

	public String loadTitle() throws Exception {
		this.jobs = (List<Job>) this.jm.loadTitle(job);
		return "loadTitle";
	}

	public String listAppliedJs() throws Exception {
		this.listJobseekers = (List<JobSeeker>) this.jm.listJsByApplyJobId(job);
		System.out.println(listJobseekers.size() + "<<<<<<<");
		return "listAppliedJs";
	}

	public List<JobSeeker> getListJobseekers() {
		return listJobseekers;
	}

	public void setListJobseekers(List<JobSeeker> listJobseekers) {
		this.listJobseekers = listJobseekers;
	}

	public List<CV> getCs() {
		return cs;
	}

	public void setCs(List<CV> cs) {
		this.cs = cs;
	}

	public JobSeeker getJs() {
		return js;
	}

	public void setJs(JobSeeker js) {
		this.js = js;
	}

	public AreaManager getAm() {
		return am;
	}

	@Resource(name = "areaManager")
	public void setAm(AreaManager am) {
		this.am = am;
	}

	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public List<Area> getListCountys() {
		return listCountys;
	}

	public void setListCountys(List<Area> listCountys) {
		this.listCountys = listCountys;
	}

	public List<Area> getListDistricts() {
		return listDistricts;
	}

	public void setListDistricts(List<Area> listDistricts) {
		this.listDistricts = listDistricts;
	}

	public List<Area> getListCountrys() {
		return listCountrys;
	}

	public void setListCountrys(List<Area> listCountrys) {
		this.listCountrys = listCountrys;
	}

	public String listCountry() throws Exception {
		this.listCountys=  am.loadByCounty(area);
		StringBuffer sb = new StringBuffer();//id_name,id_name  1_beij ,2_fujian
		sb.append("0").append("_").append("Please Select County").append(",");
		for(Area area : listCountys) {
			sb.append(area.getAreaId()).append("_").append(area.getAreaName()).append(","); 
		}
		ServletActionContext.getResponse().getWriter().print(sb.toString());
		return null;
	}
	public String getCounty() throws Exception {
		this.listCountys = am.loadByCounty(area);
		return null;
	}
	public String listDistrict() throws Exception {
		this.listDistricts = am.loadByCounty(area);
		StringBuffer sb = new StringBuffer();
		sb.append("0").append("_").append("Please Select District").append(",");
		for(Area area : listDistricts) {
			sb.append(area.getAreaId()).append("_").append(area.getAreaName()).append(","); 
		}
		ServletActionContext.getResponse().getWriter().print(sb.toString());
		return null;
	}

	public SkillCategoryManager getSkillCategoryManager() {
		return skillCategoryManager;
	}
	@Resource(name="skillCategoryManager")
	public void setSkillCategoryManager(SkillCategoryManager skillCategoryManager) {
		this.skillCategoryManager = skillCategoryManager;
	}

	public List<SkillCategory> getListMainSkillCategorys() {
		return listMainSkillCategorys;
	}

	public void setListMainSkillCategorys(List<SkillCategory> listMainSkillCategorys) {
		this.listMainSkillCategorys = listMainSkillCategorys;
	}

	public List<SkillCategory> getListSubSkillCategorys() {
		return listSubSkillCategorys;
	}

	public void setListSubSkillCategorys(List<SkillCategory> listSubSkillCategorys) {
		this.listSubSkillCategorys = listSubSkillCategorys;
	}

	public SkillCategory getSkillCategory() {
		return skillCategory;
	}

	public void setSkillCategory(SkillCategory skillCategory) {
		this.skillCategory = skillCategory;
	}

	public String listSubSkillCategorys() throws Exception {
		this.listSubSkillCategorys = skillCategoryManager.getSubSkillCategory(skillCategory);
		StringBuffer sb = new StringBuffer();
		for(SkillCategory subskillCategory : listSubSkillCategorys) {
			sb.append(subskillCategory.getSkillCategoryId()).append("_").append(subskillCategory.getName()).append(","); 
		}
		ServletActionContext.getResponse().getWriter().print(sb.toString());
		return null;
	}

	public String listSkills() throws Exception {
		this.listSkill = skillManager.getSkillsBySc(skillCategory);
		StringBuffer sb = new StringBuffer();
		for(Skill skill : listSkill) {
			String  temp = "<input type=\"checkbox\" name=\"job.checkboxes\" value=\""+skill.getSkillId()+"\"/> " + skill.getName();
			sb.append(temp); 
		}
		ServletActionContext.getResponse().getWriter().print(sb.toString());
		return null;
	}

	public String listSkills2() throws Exception {
		this.listSkill = skillManager.getSkillsBySc(skillCategory);
		StringBuffer sb = new StringBuffer();
		for(Skill skill : listSkill) {
			sb.append(skill.getSkillId() + "_" + skill.getName()).append(","); 
		}
		if (sb.toString().endsWith(",")) {
			sb.deleteCharAt(sb.length() - 1);
		}
		ServletActionContext.getResponse().getWriter().print(sb.toString());
		return null;
	}

	public List<Skill> getListSkill() {
		return listSkill;
	}

	public void setListSkill(List<Skill> listSkill) {
		this.listSkill = listSkill;
	}

	public SkillManager getSkillManager() {
		return skillManager;
	}
	@Resource(name="skillManager")
	public void setSkillManager(SkillManager skillManager) {
		this.skillManager = skillManager;
	}

	public Skill getSkill() {
		return skill;
	}

	public void setSkill(Skill skill) {
		this.skill = skill;
	}

	@Resource(name="applyJobManager")
	public void setAjm(ApplyJobManager ajm) {
		this.ajm = ajm;
	}

	public ApplyJobManager getAjm() {
		return ajm;
	}

	

	public static int getFlag() {
		return flag;
	}

	public static void setFlag(int flag) {
		JobAction.flag = flag;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public List<Job> getListJobSortByParam() {
		return listJobSortByParam;
	}

	public void setListJobSortByParam(List<Job> listJobSortByParam) {
		this.listJobSortByParam = listJobSortByParam;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public List<Area> getListIrelandCountys() {
		return listIrelandCountys;
	}

	public void setListIrelandCountys(List<Area> listIrelandCountys) {
		this.listIrelandCountys = listIrelandCountys;
	}


}
