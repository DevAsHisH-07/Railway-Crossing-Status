package com.railway.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import com.railway.pojo.FavoriteCrossing;
import com.railway.pojo.RailwayCrossing;
import com.railway.pojo.User;
import com.railway.util.Dbutil;

import java.util.List;

public class FavoriteCrossingService {

    public List<RailwayCrossing> getFavoriteCrossings(User user) {
        String username = user.getUsername();
        System.out.println("Username in FavoriteCrossingService: " + username);
        try (Session session = Dbutil.getSessionFactory().openSession()) {
            List<Integer> favoriteCrossingIds = session
                    .createQuery("SELECT crossingId FROM FavoriteCrossing WHERE username = :username", Integer.class)
                    .setParameter("username", username)
                    .list();

            return session.createQuery("FROM RailwayCrossing WHERE id IN :crossingIds", RailwayCrossing.class)
                    .setParameter("crossingIds", favoriteCrossingIds)
                    .list();
        }
    }

    public void markAsFavorite(User user, int crossingId) {
        String username = user.getUsername();
        try (Session session = Dbutil.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();

            FavoriteCrossing favoriteCrossing = new FavoriteCrossing();
            favoriteCrossing.setUsername(username);
            favoriteCrossing.setCrossingId(crossingId);

            session.save(favoriteCrossing);

            transaction.commit();
        }
    }

    public void removeFromFavorites(User user, int crossingId) {
        String username = user.getUsername();
        try (Session session = Dbutil.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();

            session.createQuery("DELETE FROM FavoriteCrossing WHERE username = :username AND crossingId = :crossingId")
                    .setParameter("username", username)
                    .setParameter("crossingId", crossingId)
                    .executeUpdate();

            transaction.commit();
        }
    }
}
