package recruitment.action;

import java.awt.Color;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.renderer.category.BarRenderer3D;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.stereotype.Component;

import recruitment.model.Job;
import recruitment.service.JobManager;

import com.opensymphony.xwork2.ActionSupport;

@Component("report3")
public class Report3Action extends ActionSupport {
	private static final long serialVersionUID = -1342997479548139515L;
	private JFreeChart chart;

	public JFreeChart getChart() {
		chart = ChartFactory.createBarChart3D("Job Category Statistics",
				"Category", "Job Number", getDataset());

		return chart;
	}

	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	private CategoryDataset getDataset() {

		DefaultCategoryDataset mDataset = new DefaultCategoryDataset();

		Map<String, Integer> rs = new HashMap<String, Integer>();
		try {
			List<Job> js = jm.getJobsForAdmin(new Job());

			for (Job j : js) {
				String name = j.getJobCategory().getName();

				Integer i = rs.get(name);
				if (i == null) {
					i = 0;
				}
				i++;

				rs.put(name, i);
			}

			List<String> s = new ArrayList<String>();
			s.addAll(rs.keySet());
			Collections.sort(s);

			for (String m : s) {
				mDataset.addValue(rs.get(m), m, m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mDataset;
	}

	@Resource(name = "jobManager")
	private JobManager jm;
}
