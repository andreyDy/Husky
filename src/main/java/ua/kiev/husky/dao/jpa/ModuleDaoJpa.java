package ua.kiev.husky.dao.jpa;

import org.springframework.stereotype.Repository;
import ua.kiev.husky.dao.ModuleDao;
import ua.kiev.husky.model.Module;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class ModuleDaoJpa implements ModuleDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Module> findAll() {
        return entityManager.createQuery("SELECT m FROM Module m", Module.class).getResultList();
    }

    @Override
    public Module findById(int id) {
        return entityManager.find(Module.class, id);
    }

    @Override
    public void save(Module module) {
        entityManager.persist(module);
    }

    @Override
    public Module findModuleByCourseIdAndName(int courseId, String name) {
        Query query = entityManager.createQuery("SELECT m FROM Module m WHERE m.course.id = :id AND m.name = :name");
        query.setParameter("id", courseId);
        query.setParameter("name", name);
        return (Module) query.getSingleResult();
    }
}
