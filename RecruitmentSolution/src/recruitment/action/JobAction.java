package recruitment.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import recruitment.model.Area;
import recruitment.model.CV;
import recruitment.model.Job;
import recruitment.model.JobCategory;
import recruitment.model.JobSeeker;
import recruitment.service.AreaManager;
import recruitment.service.JobCategoryManager;
import recruitment.service.JobManager;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Component("job")
@Scope("prototype")
public class JobAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private JobManager jm;
	private List<Job> jobs;
	private Job job = new Job();
	private String message = "";
	private List<JobSeeker> listJobseekers;
	private JobCategoryManager jobCategoryManager;
	private JobCategory jobCategory;
	private List<JobCategory> listJobCategorys;
	private List<CV> cs;
	private JobSeeker js;
	private List<Area> listCountys;
	private List<Area> listDistricts;
	private List<Area> listCountrys;
	private AreaManager am;
	private Area area;

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

	public String execute() throws Exception {
		jm.add(job);
		return "success";
	}

	public String registerJob() throws Exception {
		this.listCountrys = am.listCountrys(area);
		System.out.println(listCountrys.size() + ">>>>>>>>>>>>>>>>>>>");
		this.listJobCategorys = jobCategoryManager.getJobCategory(jobCategory);
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
		this.listCountrys = am.listCountrys(area);
		this.jobs = jm.getJobs(this.job);
		return "list";
	}

	public String first() throws Exception {
		this.listCountrys = am.listCountrys(area);
		this.jobs = jm.getJobs(this.job);
		return "first";
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
		this.listCountrys = am.listCountrys(area);
		//this.jobs = jm.getJobs(this.job);
		this.jobs = jm.getJobsByCategory(this.job);
		return "logged";
	}

	public String load() throws Exception {
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

	public JobCategoryManager getJobCategoryManager() {
		return jobCategoryManager;
	}

	@Resource(name = "jobCategoryManager")
	public void setJobCategoryManager(JobCategoryManager jobCategoryManager) {
		this.jobCategoryManager = jobCategoryManager;
	}

	public JobCategory getJobCategory() {
		return jobCategory;
	}

	public void setJobCategory(JobCategory jobCategory) {
		this.jobCategory = jobCategory;
	}

	public List<JobCategory> getListJobCategorys() {
		return listJobCategorys;
	}

	public void setListJobCategorys(List<JobCategory> listJobCategorys) {
		this.listJobCategorys = listJobCategorys;
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

}
