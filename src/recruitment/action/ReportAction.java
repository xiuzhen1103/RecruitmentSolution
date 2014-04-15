package recruitment.action;

import javax.annotation.Resource;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.data.general.DefaultPieDataset;
import org.springframework.stereotype.Component;

import recruitment.service.JobSeekerManager;

import com.opensymphony.xwork2.ActionSupport;

@Component("report")
public class ReportAction extends ActionSupport {

    private static final long serialVersionUID = -613761200209526786L;

    private JFreeChart chart;

    public JFreeChart getChart() {
        chart = ChartFactory.createPieChart3D("Jobseeker Employment statistics", getDataset(), true, false, false);
        PiePlot3D plot = (PiePlot3D) chart.getPlot();
        plot.setForegroundAlpha(0.6f);
        plot.setLabelGenerator(new StandardPieSectionLabelGenerator("{0}: ({2})"));

        return chart;
    }

    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }

    private DefaultPieDataset getDataset() {
        DefaultPieDataset dataset = new DefaultPieDataset();

        dataset.setValue("Employed", jsm.countJobSeekerHasJob());
        dataset.setValue("Unemployed", jsm.countJobSeekerDonotHasJob());

        return dataset;
    }
    
    @Resource(name = "userManager")
    private JobSeekerManager jsm;
}
