package ua.kiev.husky.dao;

import java.util.List;

public interface GenericDao<T> {

    List<T> findAll();

    T findById(int id);

    void save(T entity);
}
