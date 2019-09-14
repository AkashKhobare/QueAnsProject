package com.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.json.JSONObject;
import com.model.QueAnsModel;

@Path("/services")
public class Services {
	
	@GET
	@Path("/hello")
	public String getHello() {
		return "hello";
	}
	
	@POST
	@Path("/addQueAns") 
	public String addQueAns(String res) {
		JSONObject resJson = new JSONObject(res);
		System.out.println(resJson);
		
		String que = resJson.getString("question");
		String ans = resJson.getString("answer");
		
		QueAnsModel qam = new QueAnsModel();
		
		qam.setQuestion(que);
		qam.setAnswer(ans);
		
		String persistenceUnitName = "persistenceUnit";

		EntityManagerFactory emf = Persistence.createEntityManagerFactory(persistenceUnitName);
		EntityManager em = emf.createEntityManager();

		em.getTransaction().begin();
		em.persist(qam);
		em.getTransaction().commit();

		em.close();
		emf.close();
		
		return qam.toString();
	}

	@POST
	@Path("/editQueAns") 
	public String editQueAns(String res) {
		JSONObject resJson = new JSONObject(res);
		System.out.println(resJson);
		
		String que = resJson.getString("question");
		String ans = resJson.getString("answer");
		
		QueAnsModel qam = new QueAnsModel();
		
		qam.setQuestion(que);
		qam.setAnswer(ans);
		
		String persistenceUnitName = "persistenceUnit";

		EntityManagerFactory emf = Persistence.createEntityManagerFactory(persistenceUnitName);
		EntityManager em = emf.createEntityManager();

		em.getTransaction().begin();
		em.persist(qam);
		em.getTransaction().commit();

		em.close();
		emf.close();
		
		return qam.toString();
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	@Path("/viewAllQueAns") 
	public Response viewAllQueAns() {		
		String persistenceUnitName = "persistenceUnit";

		EntityManagerFactory emf = Persistence.createEntityManagerFactory(persistenceUnitName);
		EntityManager em = emf.createEntityManager();

		em.getTransaction().begin();
		Query query = em.createQuery("Select qa from QueAnsModel qa");
		@SuppressWarnings("unchecked")
		List<QueAnsModel> queAns = query.getResultList();
		em.getTransaction().commit();

		em.close();
		emf.close();
		
		System.out.println(queAns.toArray());
		return Response.ok(queAns.toArray()).build();
	}
	
}
