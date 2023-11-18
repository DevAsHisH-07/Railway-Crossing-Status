package com.railway.dao;

import java.util.Collections;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.railway.pojo.RailwayCrossing;
import com.railway.util.Dbutil;

public class RailwayDAO_Impl implements RailwayDAO{
	@Override
	public List<RailwayCrossing> getAllCrossings() {
	    try (Session session = Dbutil.getSessionFactory().openSession()) {
	        List<RailwayCrossing> crossings = session.createQuery("FROM RailwayCrossing", RailwayCrossing.class).list();
	        return crossings;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return Collections.emptyList(); // Return an empty list in case of an exception
	    }
	}

	
	public List<RailwayCrossing> searchCrossingsByName(String name) {
	    try (Session session = Dbutil.getSessionFactory().openSession()) {
	        return session.createQuery("FROM RailwayCrossing WHERE name LIKE :name", RailwayCrossing.class)
	                .setParameter("name", "%" + name + "%")
	                .list();
	    }
	}

	@Override
	public RailwayCrossing getCrossingById(int id) {
		try (Session session = Dbutil.getSessionFactory().openSession()) {
			return session.get(RailwayCrossing.class, id);
		}
	}

	@Override
	public void addCrossing(RailwayCrossing crossing) {
		try (Session session = Dbutil.getSessionFactory().openSession()) {
			Transaction transaction = session.beginTransaction();
			session.save(crossing);
			transaction.commit();
		}
	}

	@Override
	public void deleteCrossing(int id) {
		try (Session session = Dbutil.getSessionFactory().openSession()) {
			Transaction transaction = session.beginTransaction();
			RailwayCrossing crossing = session.get(RailwayCrossing.class, id);
			if (crossing != null) {
				session.delete(crossing);
			}
			transaction.commit();
		}
	}
    public void updateCrossing(RailwayCrossing updatedCrossing) {
        try (Session session = Dbutil.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            
            // Use merge to update the details of the crossing
            session.merge(updatedCrossing);
            
            transaction.commit();
        }
    }

}
