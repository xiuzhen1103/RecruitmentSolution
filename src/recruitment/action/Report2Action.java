package recruitment.action;

import java.awt.Color;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.stereotype.Component;

import recruitment.model.Job;
import recruitment.service.JobManager;

import com.opensymphony.xwork2.ActionSupport;

@Component("report2")
public class Report2Action extends ActionSupport {

    private static final long serialVersionUID = -613761200209526786L;

    private JFreeChart chart;

    public JFreeChart getChart() {
    	chart = ChartFactory.createLineChart("Job Create Statistics", "Time", "Number", getDataset());
    	 CategoryPlot mPlot = (CategoryPlot)chart.getPlot();  
    	 mPlot.setBackgroundPaint(Color.LIGHT_GRAY);  
    	 mPlot.setRangeGridlinePaint(Color.BLUE);
    	 mPlot.setOutlinePaint(Color.RED);
    	          
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
			
			SimpleDateFormat sdf=new SimpleDateFormat("MM/yyyy");
			for (Job j : js) {
				String t = sdf.format(j.getCreateTime());
				
				Integer i = rs.get(t);
				if (i == null) {
					i = 0;
				}
				
				i++;
				
				rs.put(t, i);
			}
			
			List<String> s = new ArrayList<String>();
			s.addAll(rs.keySet());
			Collections.sort(s, new Comparator<String>() {

				@Override
				public int compare(String o1, String o2) {
					int n1 = o1.indexOf("/");
					int n2 = o2.indexOf("/");
					String s1 = o1.substring(n1 + 1);
					String s2 = o1.substring(0, n1);
					
					String ss1 = o2.substring(n2 + 1);
					String ss2 = o2.substring(0, n2);
					
					if (!s1.equals(ss1))
						return Integer.parseInt(s1) - Integer.parseInt(ss1);
					
					return Integer.parseInt(s2) - Integer.parseInt(ss2);
				}
			});
			
			for (String m : s) {
				mDataset.addValue(rs.get(m), "Job", m);  
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

        return mDataset;
    }
    
    @Resource(name = "jobManager")
    private JobManager jm;
}
