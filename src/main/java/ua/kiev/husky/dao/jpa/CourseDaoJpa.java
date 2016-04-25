package ua.kiev.husky.dao.jpa;


import org.springframework.stereotype.Repository;
import ua.kiev.husky.dao.CourseDao;
import ua.kiev.husky.model.Course;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;


@Repository
public class CourseDaoJpa implements CourseDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public Course findByName(String courseName) {
        Query query = entityManager.createQuery("SELECT c FROM Course c WHERE c.name = :name");
        query.setParameter("name", courseName);
        return (Course) query.getSingleResult();
    }

    @Override
    public List<Course> findAll() {
        return entityManager.createQuery("SELECT c FROM Course c", Course.class).getResultList();
    }

    @Override
    public Course findById(int id) {
        return entityManager.find(Course.class, id);
    }

    @Override
    public void save(Course course) {
        entityManager.persist(course);
    }

}
