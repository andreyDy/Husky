package ua.kiev.husky.dao.jpa;

import org.springframework.stereotype.Repository;
import ua.kiev.husky.dao.UserDao;
import ua.kiev.husky.model.User;

import javax.persistence.*;
import java.util.List;


@Repository
public class UserDaoJpa implements UserDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public User findByEmail(String email) {
        Query query = entityManager.createQuery("SELECT c FROM User c WHERE c.email = :email");
        query.setParameter("email", email);
        return (User) query.getSingleResult();
    }

    @Override
    public List<User> findAll() {
        return null;
    }

    @Override
    public User findById(int id) {
        return entityManager.find(User.class, id);
    }

    @Override
    public void save(User user) {
        entityManager.persist(user);
    }

    @Override
    public void update(User user) {
        entityManager.merge(user);
    }

}
