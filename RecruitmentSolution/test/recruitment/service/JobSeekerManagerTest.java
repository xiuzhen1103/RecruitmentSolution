package recruitment.service;

import org.junit.Assert;
import org.junit.Test;

import recruitment.model.JobSeeker;
import recruitment.service.JobSeekerManager;
import recruitment.service.impl.JobSeekerManagerImpl;


public class JobSeekerManagerTest {

	@Test
	public void testExists() throws Exception {
		JobSeekerManager um = new JobSeekerManagerImpl();
		JobSeeker js = new JobSeeker();
		js.setUsername("a");
		boolean exists = um.checkJsUsernameExists(js);
		Assert.assertEquals(true, exists);
	}

	@Test
	public void testAdd() throws Exception {
		JobSeekerManager um = new JobSeekerManagerImpl();
		JobSeeker js = new JobSeeker();
		js.setUsername("b");
		js.setPassword("b");
		boolean exists = um.checkJsUsernameExists(js);
		if(!exists) {
			um.add(js);
			js.setUsername("b");
			Assert.assertEquals(true, um.checkJsUsernameExists(js));
			
		} else {
			Assert.fail("not added");
		}
		
	}

}
