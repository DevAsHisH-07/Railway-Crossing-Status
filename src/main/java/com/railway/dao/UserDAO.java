package com.railway.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.railway.pojo.User;
import com.railway.util.Dbutil;

public class UserDAO {
    public User getUserByUsername(String username) {
        Session session = Dbutil.getSessionFactory().openSession();
        try {
            return session.createQuery("FROM User WHERE username = :username", User.class)
                    .setParameter("username", username)
                    .uniqueResult();
        } finally {
            session.close();
        }
    }

	public void registerUser(String username, String password) {
		// Implementation to register a new user using Hibernate
		// This method will be used for registration

		Session session = null;
		Transaction transaction = null;

		try {
			session = Dbutil.getSessionFactory().openSession();
			transaction = session.beginTransaction();

			User newUser = new User();
			newUser.setUsername(username);
			newUser.setPassword(password);

			session.save(newUser);

			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}
	}
}
