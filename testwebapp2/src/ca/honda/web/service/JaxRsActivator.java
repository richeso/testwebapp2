package ca.honda.web.service;

import java.util.HashSet;
import java.util.Set;

import javax.ws.rs.ApplicationPath;
import javax.ws.rs.core.Application;

@ApplicationPath("/")
public class JaxRsActivator extends Application {
	private Set<Object> singletons = new HashSet<Object>();

	public JaxRsActivator() {
		singletons.add(new SimpleRESTService());
	}

	@Override
	public Set<Object> getSingletons() {
		return singletons;
	}
}