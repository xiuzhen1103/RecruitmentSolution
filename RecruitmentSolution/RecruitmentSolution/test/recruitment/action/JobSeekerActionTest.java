package recruitment.action;

import static org.junit.Assert.assertEquals;
import junit.framework.Assert;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import recruitment.action.JobSeekerAction;
import recruitment.vo.JobSeekerInfo;


public class JobSeekerActionTest {

	@Test
	public void testExecute() throws Exception {
		JobSeekerAction ua = new JobSeekerAction();
		JobSeekerInfo info = new JobSeekerInfo();
		info.setUsername("x");
		info.setPassword("xxx");
		info.setPassword("xxx");
		ua.setInfo(info);
		String ret = ua.execute();
		assertEquals("success", ret);
	}
	@Test
	public void testList() throws Exception {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("beans.xml");
		JobSeekerAction ua = (JobSeekerAction) ctx.getBean("js");
		ua.list();
		Assert.assertTrue(ua.getJobseekers().size()>0);
	}

}
